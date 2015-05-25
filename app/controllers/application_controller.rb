class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_next_meetup

  def get_next_meetup
  	@nextmeetup = Meetup.next
  end


end
