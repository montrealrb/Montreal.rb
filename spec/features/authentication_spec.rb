require 'rails_helper'

describe "the signin process", :type => :feature do
  let(:user) { User.create(:email => 'user@example.com', :password => 'password') }

  scenario "Signs me in" do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed in successfully')
  end

  scenario "Signs me out" do
    sign_in(user)

    click_link 'Sign out'
    expect(page).not_to have_content('Sign out')
    expect(page).to have_content('Signed out successfully')
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end
