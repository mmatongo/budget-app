require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user, password: 'password')
  end

  scenario 'User logs in with valid credentials' do
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_current_path root_path
  end

  scenario 'User logs in with invalid credentials' do
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'wrong'
    end
    click_button 'Log in'
    expect(page).to have_current_path new_user_session_path
  end
end
