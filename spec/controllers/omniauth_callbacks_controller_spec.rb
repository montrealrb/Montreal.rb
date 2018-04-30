# frozen_string_literal: true

require "rails_helper"

describe ::Users::OmniauthCallbacksController do
  let!(:user) { create(:user) }

  before do
    request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
  end

  describe "get#twitter" do
    it "redirects to user registration form when without email" do
      mock_auth_hash("twitter")
      OmniAuth.config.mock_auth[:twitter][:info][:email] = ""
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]

      get :twitter
      expect(response).to redirect_to new_user_registration_path
    end
  end

  describe "get#github" do
    it "redirects to user registration form when without email" do
      mock_auth_hash("github")
      OmniAuth.config.mock_auth[:github][:info][:email] = ""
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]

      get :github
      expect(response).to redirect_to new_user_registration_path
    end
  end
end
