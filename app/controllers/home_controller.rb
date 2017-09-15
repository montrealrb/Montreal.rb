# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @past_events, @future_events = Event.published.includes(
      :translations,
      :location,
      :talks,
      :sponsors
    ).order(:starts_at).limit(3).partition { |e| e.starts_at < Time.now }
  end
end
