class HomeController < ApplicationController
  def index
    @next_meetup = Meetup.next
  end
end
