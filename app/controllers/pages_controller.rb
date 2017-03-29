class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
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
    # event = Event.find(params[:id])
    # event.destroy

    # redirect_to hobby_path(@hobby)

    # men_path(Man.all)

    @events = current_user.requests
    # raise
    # @hobby = Hobby.find(params[:id])

    # @hobby = request.find(params[:id])

  end



end
