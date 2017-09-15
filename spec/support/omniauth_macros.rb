# frozen_string_literal: true

# in spec/support/omniauth_macros.rb
module OmniauthMacros
  def mock_auth_hash(provider)
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[provider.downcase.to_sym] = OmniAuth::AuthHash.new(
      'provider': provider.downcase,
      'uid': "123545",
      'info': {
        'name': "mockuser",
        'image': "mock_user_thumbnail_url",
        'email': "mock@user.com"
      },
      'credentials': {
        'token': "mock_token",
        'secret': "mock_secret"
      }
    )
  end
end
