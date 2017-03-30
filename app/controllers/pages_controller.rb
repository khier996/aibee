class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard_guest
    @current_user = current_user
    @notifications = current_user.bookings.where(review: nil)

    @bookings = @current_user.bookings
    @future_bookings = @bookings.select { |booking| booking.event.start_time > Time.now }
    @past_bookings = @bookings.select { |booking| booking.event.end_time < Time.now }
  end

  def dashboard_host


    @events = current_user.requests
    # raise
    @hobbies = current_user.hobbies

    # @hobby = request.find(params[:id])


  end


end


# @future_events = user.events.where("hobby.user_id != ? AND start_time <  ?", 11, Time.now.to_date)
