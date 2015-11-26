class HomeController < ApplicationController

  def index
    @events = Event.published.limit(2)
    @news_items = NewsItem.published.to_a
  end

end
