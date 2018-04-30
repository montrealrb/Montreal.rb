# frozen_string_literal: true

require "rails_helper"

feature "User signs in with twitter account", '
  In order to login quickly
  As an Guest
  Or as an User
  I want to be able to sign in via facebook
' do

  describe "access to questions index" do
    background do
      visit root_path
      click_on "Log in"
      mock_auth_hash("twitter")
    end

    scenario "user sees the link to twitter login" do
      expect(page).to have_link "Sign in with Twitter"
    end

    scenario "non-existing user tries to sign in via twitter" do
      click_on "Sign in with Twitter"
      expect(page).to have_content "Successfully authenticated from Twitter account"
      expect(page).to have_link "Sign out"
      expect(current_path).to eq root_path
    end

    context "existing user" do
      let!(:user) { create(:user, email: "mock@user.com") }

      scenario "existing user tries to sign in via twitter" do
        click_on "Sign in with Twitter"
        expect(page).to have_content "Successfully authenticated from Twitter account"
        expect(page).to have_link "Sign out"
        expect(current_path).to eq root_path
      end
    end

    scenario "can handle authentication error" do
      OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
      click_on "Sign in with Twitter"
      expect(page).to have_content("Could not authenticate you from Twitter")
      expect(page).to have_content("Invalid credentials")
    end
  end
end
