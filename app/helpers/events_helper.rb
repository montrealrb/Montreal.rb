# frozen_string_literal: true

module EventsHelper
  def truncate_if_past(event, text)
    if event.starts_at.future?
      text
    else
      truncate(text, length: 300, omission: " ", separator: " ") do
        link_to icon("far", "long-arrow-right"), event
      end
    end
  end
end
