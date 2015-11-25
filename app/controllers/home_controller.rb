class HomeController < ApplicationController

  def index
    @events = Event.published.limit(2)
  end

end
