class RsvpsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @rsvp = @event.rsvps.new
    @rsvp.email = params[:rsvp][:email]
    flash[:alert] = "Please enter your email" unless @rsvp.save

    redirect_to @event
  end
end
