class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_next_meetup, :get_events

  def after_sign_in_path_for(_resource)
    return admin_root_path if current_user.admin?
    root_path
  end

  def get_next_meetup
    @next_meetup = Meetup.next
  end

  def get_events
    @events = Event.published
  end
end
