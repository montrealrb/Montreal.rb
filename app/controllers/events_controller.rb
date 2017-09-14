# frozen_string_literal: true
class EventsController < ApplicationController
  def index
    @past_events, @future_events = Event.published.includes(
      :translations,
      :location,
      :talks,
      :sponsors
    ).partition { |e| e.starts_at < Time.now }
  end

  def show
    @event = Event.find(params[:id])
  end
end
