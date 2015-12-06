require 'rails_helper'

describe "Authentication" do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  context "Guest user" do
    scenario "Can sign up" do
      visit new_user_registration_path
      fill_in "Email", with: "guest@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"

      expect(page).to have_success_notification
    end

    scenario "Can not access admin area" do
      visit admin_root_path

      expect(current_path).to eq(new_user_session_path)
      expect(page).to have_alert_notification
    end
  end

  context "Regular user" do
    scenario "Can sign in and out" do
      sign_in(user)

      expect(page).to have_success_notification

      click_link "Sign out"

      expect(page).to have_success_notification
    end

    scenario "Can not access admin area" do
      sign_in(user)
      visit admin_root_path

      expect(page).to have_alert_notification
    end
  end

  context "Admin user" do
    scenario "Can access admin area" do
      sign_in(admin)

      expect(current_path).to eq(admin_root_path)
      expect(page).to have_css(".flash--notice", text: "success")
    end
  end

  def sign_in(user)
    visit root_path
    click_link "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  def have_success_notification
    have_css(".alert-success")
  end

  def have_alert_notification
    have_css(".alert-danger")
  end
end
