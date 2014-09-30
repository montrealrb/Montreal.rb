class EventsController < ApplicationController

  def index
    @events = Event.published
  end

end
