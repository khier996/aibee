class EventsController < ApplicationController

  def index
    @events = policy_scope(Event).order(created_at: :desc)
    @events = Event.all
    authorize @event

  end

  def new
    @event = Event.new(event_params)
    authorize @event
  end

  def create

    @event = Event.new(event_params)
    @event.hobby_id = current_user[:id]
    authorize @event
    if @event.save
      redirect_to events_path
    else
      render :new
    end

  end

  def edit
    authorize @event

  end

  def update
    authorize @event

  end

  def destroy
    authorize @event

  end

  private

  def event_params
    params.require(:event).permit(:price, :start_time, :end_time, :min_pax, :max_pax)

  end
end








