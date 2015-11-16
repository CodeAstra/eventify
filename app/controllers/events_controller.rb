class EventsController < ApplicationController
  before_action :fetch_event, only: [:edit, :update, :destroy]

  def new
    @event = Event.pretty_new
  end

  def create
    @event = current_user.events.new(event_params)
    set_start_and_end_time
    @event.save
    redirect_to events_path
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @rsvps = @event.rsvps.all
    @new_rsvp = @event.rsvps.new
  end

  def edit
  end

  def update
    set_start_and_end_time
    @event.update_attributes(event_params)
    redirect_to @event
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

private
  def event_params
    params.require(:event).permit(:title, :description)
  end

  def set_start_and_end_time
    @event.start_time = parse_time(:event, "start_time")
    @event.end_time = parse_time(:event, "end_time")
  end

  def fetch_event
    @event = current_user.events.find(params[:id])
  end
end
