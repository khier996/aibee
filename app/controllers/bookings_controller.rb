class BookingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    # event host cannot book his own event
    if current_user.id == @event.hobby.user_id
      flash[:notice] = "You cannot book your own event"
      redirect_to hobby_path(@event.hobby)
    else
      # event cannot be booked twice the by one person
      existing_booking = Booking.where(event_id: @event.id, user_id: current_user.id)
      if existing_booking
        flash[:notice] = "You already made a booking for this event"
        redirect_to hobby_path(@event.hobby)
      else
        @booking = Booking.new(booking_params)
        @booking.status = "accepted"
        if @booking.save
          flash[:notice] = "You booked a new event"
          redirect_to hobbies_path
        else

        end
      end
    end
  end

  def update
  end

  def destroy
  end

  def cancel
  end

  def booking_params
    require(:booking).permit(:pax)
  end
end
