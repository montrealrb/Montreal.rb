# frozen_string_literal: true
class SlackInvitationSendingService
  def initialize(user, token = ENV['SLACK_TOKEN'])
    @user = user
    @token = token
  end

  def success?
    @success
  end

  def call
    return true if @token.nil?
    send_invite
    self
  end

  private

  def send_invite
    response = JSON.parse Faraday.get(url).body

    if response['ok']
      Rails.logger.info("slack invitation sent to: #{@user.email}".colorize(:green))
      @success = true
    else
      Rails.logger.info("slack invitation failed to send to #{@user.email}".colorize(:red))
      Rails.logger.info(response.inspect.colorize(:yellow))
      @success = false
    end
  end

  def url
    URI::HTTPS.build({
      host: 'slack.com',
      path: '/api/users.admin.invite',
      query: {
      set_active: true,
      _attempts: 1,
      token: @token,
      email: URI.escape(@user.email)
    }.to_param
    })
  end
end
