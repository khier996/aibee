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
    @booking = Booking.find(params[:id])
    authorize @booking

    if @booking.update(params.require(:booking).permit(:status, :review, :comment))
      update_hobby_score(@booking)
      respond_to do |format|
        format.html { redirect_to dashboard_guest_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_guest_path }
        format.js
      end
    end
  end

  def destroy
  end

  private

  def booking_params
    require(:booking).permit(:pax)
  end

  def update_hobby_score(booking)
    if params[:booking][:review]
      review = params[:booking][:review].to_f
      hobby = booking.event.hobby
      average_score = hobby.average_score ? hobby.average_score : 0
      review_count = hobby.review_count ? hobby.review_count : 0
      hobby.average_score = (average_score * review_count + review) / (review_count + 1)
      hobby.review_count = hobby.review_count + 1
      hobby.save
    end
  end
end
