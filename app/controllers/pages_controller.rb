class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @hobbies = Hobby.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@hobbies) do |hobby, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def dashboard_guest
    @current_user = current_user
    @past_events = current_user.events.where("end_time <=  ?",  Time.now.to_date)
    @future_events = current_user.events.where("start_time >  ?",  Time.now.to_date)
    @notifications = current_user.bookings.where(review: nil)
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
