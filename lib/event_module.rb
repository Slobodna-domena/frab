EventsController.class_eval do

  # show event ratings
  def ratings
    authorize @conference, :read?

    result = search @conference.events_with_review_averages.includes(:track)
    @events = result.paginate page: page_param
    clean_events_attributes


    if !current_user.conference_users.where(conference_id: @conference).blank? && current_user.conference_users.where(conference_id: @conference.id).first.role == "reviewer" && Event::ACADEMIC_CONST.size >= 1
      @events = Event.where(id: @events.where(event_type: Event::ACADEMIC_CONST).select{|event| !event.in?(current_user.person.own_papers(@conference)) && !event.in?(current_user.person.coauthored_papers(@conference)) && event.event_ratings.where(peer: true).blank? && (event.event_ratings.where(peer: false).blank? || !event.event_ratings.select{|er| er.person_id == current_user.person.id}.blank?)}.map{|e| e.id}).paginate page: page_param
    end

    @num_of_matching_events = result.reorder('').pluck(:id).count

    # total ratings:
    @events_total = @conference.events.count
    @events_reviewed_total = @conference.events.to_a.count { |e| !e.event_ratings_count.nil? && e.event_ratings_count > 0 }
    @events_no_review_total = @events_total - @events_reviewed_total

    # current_user rated:
    @events_reviewed = @conference.events.joins(:event_ratings).where('event_ratings.person_id' => current_user.person.id).where.not('event_ratings.rating' => [nil, 0]).count
    @events_no_review = @events_total - @events_reviewed
  end

  # returns duplicates if ransack has to deal with the associated model
  def search(events)
    filter = events
    helpers.filters_data.each do |f|
      if params[f.qname]
        filter = filter.where(f.attribute_name => criteria_from_param(f))
      end
    end
    filter = filter.associated_with(current_user.person) if helpers.showing_my_events?

    filter = filter_by_rating(params[:rating],params[:operator],filter,params)

    @search = perform_search(filter, params, %i(title_cont description_cont abstract_cont track_name_cont event_type_is id_in))
    if params.dig('q', 's')&.match('track_name')
      @search.result
    else
      @search.result(distinct: true)
    end

  end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.conference = @conference
    authorize @event

    respond_to do |format|
      if @event.save
        create_coauthors
        format.html { redirect_to(@event, notice: t('cfp.event_created_notice')) }
      else
        @start_time_options = @conference.start_times_by_day
        format.html { render action: 'new' }
      end
    end
  end

  def event_params
    translated_params = @conference.language_codes.map { |l|
      n = Mobility.normalize_locale(l)
      [:"title_#{n}", :"subtitle_#{n}", :"abstract_#{n}", :"description_#{n}"]
    }.flatten

    params.require(:event).permit(
      :id, :title, :subtitle, :event_type, :coauthors, :coauthor_1,:coauthor_2,:coauthor_3,:coauthor_4,:coauthor_5, :time_slots, :state, :start_time, :public, :language, :abstract, :description, :logo, :track_id, :room_id, :note, :submission_note, :do_not_record, :recording_license, :tech_rider,
      *translated_params,
      event_attachments_attributes: %i(id title attachment public _destroy),
      ticket_attributes: %i(id remote_ticket_id),
      links_attributes: %i(id title url _destroy),
      event_classifiers_attributes: %i(id classifier_id value _destroy),
      event_people_attributes: %i(id person_id event_role role_state notification_subject notification_body _destroy)
    )
  end

  # PUT /events/1
  def update
    @event = authorize Event.find(params[:id])

    respond_to do |format|
      if @event.update(event_params)
        create_coauthors
        format.html { redirect_to(@event, notice: t('cfp.event_updated_notice')) }
        format.js   { head :ok }
      else
        flash_model_errors(@event)
        @start_time_options = PossibleStartTimes.new(@event).all
        format.html { render action: 'edit' }
        format.js { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_coauthors
    coauthors = [@event.coauthor_1,@event.coauthor_2,@event.coauthor_3,@event.coauthor_4,@event.coauthor_5].select{|a| !a.blank? && a =~ URI::MailTo::EMAIL_REGEXP}
    submitters = @event.event_people.where(event_role: "submitter").map{|ep| ep.person_id}
    @event.event_people.where(event_role: "speaker").where.not(person_id: submitters).delete_all
    if !coauthors.blank?
      coauthors.each do |ca|
        user = User.find_by(email: ca)
        if user
          if !@event.speakers.include?(user.person)
            EventPerson.create!(event_id: @event.id, event_role: "speaker",role_state: "confirmed",person_id: user.person.id)
          end
        else
          person = Person.new(
            email: ca,
            first_name: '',
            last_name: '',
            public_name: ca,
          )
          person.save!(:validate => false)

          password = SecureRandom.urlsafe_base64(32)
          user = User.new(
            email: person.email,
            password: password,
            password_confirmation: password
          )
          user.person = person
          user.role = 'submitter'
          user.confirmed_at = Time.now
          user.gdpr = true
          user.save!(:validate => false)
          EventPerson.create!(event_id: @event.id, event_role: "speaker", role_state: "confirmed", person_id: person.id)
        end
      end
    end
    @event.people.each do |p|
      Availability.build_for(@event.conference).each do |a|
        a.person_id = p.id
        a.save!
      end
    end
  end

  def filter_by_rating(rating,operator,result,params)
    event = result.first
    if event
      contains = false
      conference = event.conference
      temp_ids = []
      classifiers = conference.classifiers
      classifiers.each do |classifier|
        if params.has_key?(classifier.name)
          contains = true
          temp_ids << classifier.event_classifiers.map{|ec| ec.event}.select{|e| e.in?(result)}
          temp_ids = temp_ids.uniq.flatten
        end
      end
    end

    if contains
      result = Event.where(id: temp_ids.map{|e| e.id})
    else
      result = result
    end
    if operator && rating && (1..5).include?(operator.to_i) && (1..10).include?(rating.to_f)
      case operator.to_i
      when 1
        return result.where("average_rating IS NOT NULL AND average_rating = #{rating.to_f}")
      when 2
        return result.where("average_rating IS NOT NULL AND average_rating > #{rating.to_f}")
      when 3
        return result.where("average_rating IS NULL OR average_rating < #{rating.to_f}")
      when 4
        return result.where("average_rating IS NULL OR average_rating <= #{rating.to_f}")
      when 5
        return result.where("average_rating IS NOT NULL AND average_rating >= #{rating.to_f}")
      else
        return
      end
    end

    return result
  end
end

Cfp::EventsController.class_eval do


    # POST /cfp/events
    def create
      @event = Event.new(event_params.merge(recording_license: @conference.default_recording_license))
      @event.conference = @conference
      @event.event_people << EventPerson.new(person: @person, event_role: 'submitter')
      @event.event_people << EventPerson.new(person: @person, event_role: 'speaker')

      respond_to do |format|
        if @event.save
          create_coauthors
          format.html { redirect_to(cfp_person_path, notice: t('cfp.event_created_notice')) }
        else
          format.html { render action: 'new' }
        end
      end
    end

    # PUT /cfp/events/1
    def update
      @event.recording_license = @event.conference.default_recording_license unless @event.recording_license

      respond_to do |format|
        if @event.update(event_params)
          create_coauthors
          format.html { redirect_to(cfp_person_path, notice: t('cfp.event_updated_notice')) }
        else
          flash_model_errors(@event)
          format.html { render action: 'edit' }
        end
      end
    end

  def event_params
    params.require(:event).permit(
      :title, :subtitle, :event_type, :time_slots, :coauthors, :coauthor_1,:coauthor_2,:coauthor_3,:coauthor_4,:coauthor_5,:language, :abstract, :description, :logo, :track_id, :submission_note, :tech_rider,
      event_attachments_attributes: %i(id title attachment public _destroy),
      event_classifiers_attributes: %i(id classifier_id value _destroy),
      links_attributes: %i(id title url _destroy)
    )
  end

  def create_coauthors
    coauthors = [@event.coauthor_1,@event.coauthor_2,@event.coauthor_3,@event.coauthor_4,@event.coauthor_5].select{|a| !a.blank? && a =~ URI::MailTo::EMAIL_REGEXP}
    submitters = @event.event_people.where(event_role: "submitter").map{|ep| ep.person_id}
    @event.event_people.where(event_role: "speaker").where.not(person_id: submitters).delete_all
    if !coauthors.blank?
      coauthors.each do |ca|
        user = User.find_by(email: ca)
        if user
          if !@event.speakers.include?(user.person)
            EventPerson.create!(event_id: @event.id, event_role: "speaker",role_state: "confirmed",person_id: user.person.id)
          end
        else
          person = Person.new(
            email: ca,
            first_name: '',
            last_name: '',
            public_name: ca,
          )
          person.save!(:validate => false)

          password = SecureRandom.urlsafe_base64(32)
          user = User.new(
            email: person.email,
            password: password,
            password_confirmation: password
          )
          user.person = person
          user.role = 'submitter'
          user.confirmed_at = Time.now
          user.gdpr = true
          user.save!(:validate => false)
          EventPerson.create!(event_id: @event.id, event_role: "speaker", role_state: "confirmed", person_id: person.id)
        end
      end
    end
    @event.people.each do |p|
      Availability.build_for(@event.conference).each do |a|
        a.person_id = p.id
        a.save!
      end
    end
  end
end

Event.class_eval do
  has_one :paper
  validates_format_of :coauthor_1,:with => URI::MailTo::EMAIL_REGEXP, :allow_blank => true, :allow_nil => true
  validates_format_of :coauthor_2,:with => URI::MailTo::EMAIL_REGEXP, :allow_blank => true, :allow_nil => true
  validates_format_of :coauthor_3,:with => URI::MailTo::EMAIL_REGEXP, :allow_blank => true, :allow_nil => true
  validates_format_of :coauthor_4,:with => URI::MailTo::EMAIL_REGEXP, :allow_blank => true, :allow_nil => true
  validates_format_of :coauthor_5,:with => URI::MailTo::EMAIL_REGEXP, :allow_blank => true, :allow_nil => true

  validates :abstract, presence: true

  PRACTICAL_CONST = ["Non-academic Session"]
  ACADEMIC_CONST = ["Paper Presentation", "Special Session"]


  after_create do |resource|
    Paper.create(event_id: resource.id)
    if resource.event_type.in?(ACADEMIC_CONST)
      timeslot = resource.event_type == "Paper Presentation" ? 1 : 6
      resource.update_column(:time_slots, timeslot)
    elsif resource.event_type.in?(PRACTICAL_CONST)
      timeslot = 6
      resource.update_column(:time_slots, timeslot)
    end
    resource.people.each do |p|
      Availability.build_for(resource.conference).each do |a|
        a.person_id = p.id
        a.save!
      end
    end
  end

  after_update do |resource|
    if resource.event_type.in?(ACADEMIC_CONST)
      timeslot = resource.event_type == "Paper Presentation" ? 1 : 6
      resource.update_column(:time_slots, timeslot)
    elsif resource.event_type.in?(PRACTICAL_CONST)
      timeslot = 6
      resource.update_column(:time_slots, timeslot)
    end
  end
end


module EventModule

  PRACTICAL_CONST = ["Non-academic Session"]
  ACADEMIC_CONST = ["Paper Presentation", "Special Session"]

  def average_of_nonzeros(list)
    if self.event_type.in?(ACADEMIC_CONST)
      peer = self.event_ratings.where(peer: true)
      pro = self.event_ratings.where(peer: false)
      #review_metrics = self.review_scores.pluck(:score)
      peer = peer.map{|p| p.rating}
      pro = pro.map{|p| p.rating}# + review_metrics
      peers = peer.reduce(:+).to_f / peer.size
      pros = pro.reduce(:+).to_f / pro.size
      if peer.size == 0
        return pros
      elsif pro.size == 0
        return peers
      else
        return ((peers+pros)/2.0).to_f
      end
    else
      return nil unless list
      list=list.select{ |x| x && x>0 }
      return nil if list.empty?
      list.reduce(:+).to_f / list.size
    end
  end

end
