class HomeController < ApplicationController
  def index
    @past_events, @future_events = Event.published.partition { |e| e.starts_at < Time.now }
    @news_items = NewsItem.published.limit(10).to_a
  end
end
