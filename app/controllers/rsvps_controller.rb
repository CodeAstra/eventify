class RsvpsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @rsvp = @event.rsvps.new
    @rsvp.user = current_user
    @rsvp.save!

    redirect_to @event
  end
end
