# frozen_string_literal: true
require "open-uri"

module ApplicationHelper
  def full_title(page_title = "")
    base_title = "Montreal.rb"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
