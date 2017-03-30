class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard_guest
    @current_user = current_user
    @past_events = current_user.events.where("end_time <=  ?",  Time.now.to_date)
    @future_events = current_user.events.where("start_time >  ?",  Time.now.to_date)
    @notifications = current_user.bookings.where(review: nil)
  end

  def dashboard_host


    @events = current_user.requests
    # raise
    @hobbies = current_user.hobbies

    # @hobby = request.find(params[:id])


  end


end


# @future_events = user.events.where("hobby.user_id != ? AND start_time <  ?", 11, Time.now.to_date)
