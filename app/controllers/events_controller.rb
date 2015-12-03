class EventsController < ApplicationController
  before_action :load_event, only: [:show]

  def index
    @events = Event.published
  end

  def show

  end

  private
    def load_event
      @event = Event.find(params[:id])
    end

end
