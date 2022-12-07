EventRatingsController.class_eval do

  def update
    @rating = @event.event_ratings.find_by!(person_id: current_user.person.id)

    if @rating.update(event_rating_params)
      @rating.update(rating: calc_avg(@rating))
      redirect_to event_event_rating_path, notice: t('ratings_module.notice_rating_updated')
    else
      flash[:alert] = t('ratings_module.error_updating')
      render action: 'show'
    end
  end

  protected

  def new_event_rating
    rating = EventRating.new(event_rating_params)
    rating.event = @event
    rating.rating = calc_avg(rating)
    rating.person = current_user.person
    rating
  end

  private

  def calc_avg(rating)
    return 0 if rating.review_scores.blank?
    rating_result = 0.0
    count = 0
    rating.review_scores.each do |rs|
      next if rs.score == 0
      count = count + 1
      rating_result = rating_result + rs.score
    end
    return (rating_result*1.0)/count
  end

end


module EventRatingModule

end
