class HomeController < ApplicationController
  def index
    if Conference.future.first
      redirect_to cfp_root_path(conference_acronym: Conference.future.first.acronym)
    else
      @conferences = Conference.future.includes(:call_for_participation).paginate(page: page_param)
    end
  end

  def past
    @conferences = Conference.past.includes(:call_for_participation).paginate(page: page_param)
    render 'index'
  end
end
