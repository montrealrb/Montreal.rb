class EventsController < ApplicationController

  def index
    @events = Event.published
  end

  def show
    @event = Event.find(params.require(:id))
  end

end
