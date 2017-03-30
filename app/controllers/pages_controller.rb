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
    #    @current_choice = params[:bookings] || "all"
    # if params[:bookings] == "confirmed"
    #   @bookings = current_user.bookings.where(status: "confirmed")

    # elsif params[:bookings] == "pending"
    #   @bookings = current_user.bookings.where(status: "pending")

    # elsif params[:bookings] == "rejected"
    #   @bookings = current_user.bookings.where(status: "rejected")

    # else
    #   @bookings = current_user.bookings
    # end

    # @bookings = current_user.bookings
    # @requests = current_user.requests
    # @current_user = current_user
    # @men = current_user.men


    # authorize @event


    # men_path(Man.all)

    @events = current_user.requests
    # raise
    # @hobby = Hobby.find(params[:id])

    # @hobby = request.find(params[:id])


  end


end


# @future_events = user.events.where("hobby.user_id != ? AND start_time <  ?", 11, Time.now.to_date)
