class BookingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])

    # look for a booking with current_user.id and @event.id
    @existing_booking = Booking.where(event_id: @event.id, user_id: current_user.id)
    # if we find it, stop and say that a booking is already made
    if @existing_booking
      flash[:notice] = "You already made a booking for this event"
    # else, proceed
    else
      @booking = Booking.new(booking_params)
      if @booking.save
         flash[:notice] = "Your booking has been created"
        redirect_to
      else
        render ""
      end
    end
  end

  def update
  end

  def destroy
  end

  def booking_params
    require(:booking).permit(:pax, :status)
  end
end
