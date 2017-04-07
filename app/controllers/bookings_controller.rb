class BookingsController < ApplicationController

  def accept
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = "accepted"
    if @booking.save
      respond_to do |format|
          format.html { redirect_to dashboard_host_path }
          format.js
      end
    end
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = "rejected"
    if @booking.save
      respond_to do |format|
        format.html { redirect_to dashboard_host_path }
        format.js
      end
    end
  end

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
      existing_booking = Booking.where(event_id: @event.id, user_id: current_user.id, status: "pending")
      if existing_booking.empty?
        existing_booking = Booking.where(event_id: @event.id, user_id: current_user.id, status: "accepted")
      end

      if existing_booking.present?
        flash[:notice] = "You already made a booking for this event"
        redirect_to dashboard_guest_path
      else
        @booking.status = "pending"
        @booking.user_id = current_user.id
        @booking.event_id = @event.id
        if @booking.save
          flash[:notice] = "Congrats! You booked this event"
          redirect_to dashboard_guest_path
        else
          flash[:notice] = "Sorry, there is an internal error. We are working on it!"
          redirect_to hobby_path(@event.hobby)
        end
      end
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking

    if @booking.update(params.require(:booking).permit(:status, :review, :comment, :pax))
      flash[:notice] = "Your booking pax has been udpated" if params[:booking][:pax]
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

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private
  def booking_params
    params.require(:booking).permit(:pax, :comment, :review, :status)
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
