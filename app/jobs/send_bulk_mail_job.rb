class SendBulkMailJob
  include SuckerPunch::Job

  def perform(template, destination)
    if destination.kind_of? String
      event_people = EventPerson
        .joins(event: :conference)
        .where('conferences.id': template.conference.id)

      case destination
      when 'all_speakers_in_confirmed_events'
        event_people = event_people
          .where('events.state': 'confirmed')
          .where('event_people.event_role': EventPerson::SUBSCRIBERS)

      when 'all_speakers_in_unconfirmed_events'
        event_people = event_people
          .where('events.state': 'unconfirmed')
          .where('event_people.event_role': EventPerson::SUBSCRIBERS)

      when 'all_speakers_in_scheduled_events'
        event_people = event_people
          .where('events.state': 'scheduled')
          .where('event_people.event_role': EventPerson::SUBSCRIBERS)
      else
        raise "unsupported destination #{destination}"
      end
      destination_event_people = event_people
    else
      destination_event_people = destination
    end

    #ep_ids = (1..347).to_a + [376,318]
    #destination_event_people = destination_event_people.where("event_id not in (?) and event_role <> 'submitter'", ep_ids)
    destination_event_people.pluck(:person_id).uniq.each do |p_id|
      c = Conference.first
      next if c.mail_sent.include?(p_id)
      UserMailer.bulk_mail_multiple_roles(destination_event_people.where(person_id: p_id), template).deliver_now
      p=Person.find(p_id)
      Rails.logger.info "Mail template #{template.name} delivered to #{p.first_name} #{p.last_name} (#{p.email})"
      new_mail_sent = c.mail_sent
      new_mail_sent << p_id
      c.update_attribute('mail_sent', new_mail_sent)
    end
  end
end
