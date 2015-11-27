class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_next_meetup, :get_events

  def get_next_meetup
    @next_meetup = Meetup.next
  end

  def get_events
    @events = Event.published
  end
end
