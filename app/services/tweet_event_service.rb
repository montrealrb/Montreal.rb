class TweetEventService
  include Rails.application.routes.url_helpers

  def initialize(event)
    @event = event
  end

  def success?
    @success
  end

  def call
    twitter_client.update(message)
    Rails.logger.info "Sent tweet: \"#{message}\""
    @success = true
  rescue Twitter::Error
    Rails.logger.info "Tweet not sent"
    @success = false
  end

  private

  def message
    "Our next event: #{@event.title}, #{event_url(@event)}"
  end

  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end
end
