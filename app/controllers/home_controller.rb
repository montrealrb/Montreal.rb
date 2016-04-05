class HomeController < ApplicationController
  def index
    @past_events, @future_events = Event.published.partition { |e| e.starts_at < Time.now }
  end
end
