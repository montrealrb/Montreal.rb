class TweetModelService
  include Rails.application.routes.url_helpers

  attr_reader :model

  def initialize(model)
    @model = model
  end

  def success?
    @success
  end

  def tweet(message)
    message = "#{message}, #{url(model)}"
    twitter_client.update(message)
    Rails.logger.info "Sent tweet: #{message}"
    @success = true
  rescue Twitter::Error
    Rails.logger.info "Tweet not sent"
    @success = false
  end

  private

  def url(model)
    send("#{model.model_name.name.downcase}_url", @model.id)
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
