class RsvpsController < ApplicationController
  def create
    @rsvp = Rsvp.new
    @rsvp.email = params[:rsvp][:email]
    @rsvp.save!
    redirect_to events_path
  end
end
