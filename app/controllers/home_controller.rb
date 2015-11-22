class HomeController < ApplicationController

  def index
    @events = Event.published
  end

end
