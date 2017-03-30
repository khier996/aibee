class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @hobby = Hobby.find(params[:hobby_id])
    @event = Event.find(params[:event_id])
    if current_user.id == @hobby.user_id
      flash[:notice] = "You cannot book your own event"
      redirect_to hobby_path(@event.hobby)
    else
      # event cannot be booked twice the by one person
      existing_booking = Booking.where(event_id: @event.id, user_id: current_user.id)
      if existing_booking.present?
        flash[:notice] = "You already made a booking for this event"
        redirect_to hobby_path(@event.hobby)
      else
        @booking.status = "accepted"
        @booking.user_id = current_user.id
        @booking.event_id = @event.id
        if @booking.save
          flash[:notice] = "Congrats! You booked this event"
          redirect_to hobbies_path
        else
          flash[:notice] = "Sorry, there is an internal error. We are working on it!"
          redirect_to hobby_path(@event.hobby)
        end
      end
    end
  end

  def update
  end

  def destroy
  end

  def booking_params
    params.require(:booking).permit(:pax, :comment, :review, :status)
  end
end
