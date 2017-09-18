# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @past_events, @future_events = Event.published.includes(
      :translations,
      :location,
      :sponsors,
      talks: %i(member translations)
    ).order(:starts_at).limit(3).partition { |e| e.starts_at < Time.now }
  end
end
