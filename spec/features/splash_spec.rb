require 'rails_helper'

RSpec.feature 'Splash', type: :feature do
  scenario 'User visits the splash page' do
    visit root_path
    expect(page).to have_content 'BudgetApp'
    expect(page).to have_link 'Log in'
    expect(page).to have_link 'Sign up'
    expect(page).to have_current_path root_path
  end

  scenario 'User visits the login page' do
    visit root_path
    click_link 'Log in'
    expect(page).to have_current_path new_user_session_path
  end

  scenario 'User visits the signup page' do
    visit root_path
    click_link 'Sign up'
    expect(page).to have_current_path new_user_registration_path
  end
end
