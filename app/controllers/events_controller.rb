# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    grouped_events = Event.published.includes(
      :translations,
      :location,
      :talks,
      :sponsors
    ).order(:starts_at).group_by do |event|
      if event.starts_at < Date.today
        :past
      elsif event.starts_at.to_date == Date.today
        :today
      else
        :future
      end
    end
    
    @past_events, @todays_event, @future_events = grouped_events.values_at(
      :past, :today, :future
    )

  end

  def show
    @event = Event.find(params[:id])
  end
end
