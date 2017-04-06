class EventsController < ApplicationController

  def index
    @booking = Booking.new
    @hobby = Hobby.find(params[:hobby_id])
    @events = policy_scope(@hobby.events).order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @hobby = Hobby.find(params[:hobby_id])
    @bookings = @event.bookings

    authorize @event

  end

  def new
    @hobby = Hobby.find(params[:hobby_id])
    @event = Event.new
    authorize @event
  end

  def create
    @hobby = Hobby.find(params[:hobby_id])
    @event = Event.new(event_params)
    @event.hobby_id = @hobby[:id]
    authorize @event
    if @event.save
      redirect_to hobby_path(@hobby)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @hobby = Hobby.find(params[:hobby_id])
    authorize @event

    @users = User.all

  end

  def update
    @hobby = Hobby.find(params[:hobby_id])
    @event = Event.find(params[:id])
    @event.update(event_params)
    authorize @event
    redirect_to hobby_path(@hobby)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    @hobby = Hobby.find(params[:hobby_id])
    authorize @event
    redirect_to dashboard_host_path
  end

  private

  def event_params
    params.require(:event).permit(:price, :start_time, :end_time, :min_pax, :max_pax)

  end
end








