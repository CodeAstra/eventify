class RsvpsController < ApplicationController
  before_action :fetch_event

  def create
    @rsvp = @event.rsvps.new
    @rsvp.user = current_user
    @rsvp.save!

    redirect_to @event
  end

  def destroy
    @rsvp = @event.rsvps.find(params[:id])
    @rsvp.destroy
    redirect_to @event
  end

private
  def fetch_event
    @event = Event.find(params[:event_id])
  end
end
