# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    grouped_events = Event.published.includes(
      :translations,
      :location,
      :sponsors,
      :organizer,
      talks: %i(member translations)
    ).order(:starts_at).limit(5).group_by do |event|
      if event.starts_at < Time.zone.today
        :past
      elsif event.starts_at.to_date == Time.zone.today
        :today
      else
        :future
      end
    end
    @past_events, @todays_event, @future_events = grouped_events.values_at(
      :past, :today, :future
    )

  end

end
