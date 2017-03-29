class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard_guest
    @past_events = current_user.events.where("end_time <=  ?",  Time.now.to_date)
    @future_events = current_user.events.where("start_time >  ?",  Time.now.to_date)
    @notifications = current_user.bookings.where(review: nil)
  end
end


# @future_events = user.events.where("hobby.user_id != ? AND start_time <  ?", 11, Time.now.to_date)
