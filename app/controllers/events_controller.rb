class EventsController < ApplicationController
  def new
    @event = Event.pretty_new
  end

  def index
  end
end
