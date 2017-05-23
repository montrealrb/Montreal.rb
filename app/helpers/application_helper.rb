# frozen_string_literal: true
require "open-uri"
require "colorize"

module ApplicationHelper
  def full_title(page_title = "")
    base_title = "Montreal.rb"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def email_slack_invite(user_email)
    # Get the channel ID from https://slack.com/api/channels.list?token=<YOUR_TOKEN>
    channels = ""

    # Get the auth token from: https://api.slack.com/web
    token = ""

    # Construct the API request URL
    # This is not documented by Slack, and may not work forever
    # As it is an unofficial API endpoint, use at your own risk!
    url = "https://slack.com/api/users.admin.invite"
    url += "?channels=#{channels}"
    url += "&set_active=true"
    url += "&_attempts=1"
    url += "&token=#{token}"
    url += "&email=#{URI.escape(user_email)}"

    # Make the request and capture the response
    response = JSON.parse(open(url).read)

    if response["ok"]
      Rails.logger.info("slack invitation sent to: #{user_email}".colorize(:green))
    else
      Rails.logger.info("slack invitation failed to send to #{user_email}".colorize(:red))
      Rails.logger.info(response.inspect.colorize(:yellow))
    end
  end
end
