require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  given(:user) { FactoryBot.build(:user) }

  scenario "User signs up with valid credentials" do
    visit new_user_registration_path
    within("form") do
      fill_in "Full Name", with: user.name
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Confirm password", with: user.password
    end
    click_button "Next"
    expect(page).to have_current_path root_path
  end

  given(:new_user) { FactoryBot.build(:user) }

  scenario "User signs up with invalid credentials" do
    visit new_user_registration_path
    within("form") do
      fill_in "Full Name", with: new_user.name
      fill_in "Email", with: new_user.email
      fill_in "Password", with: ""
      fill_in "Confirm password", with: ""
    end
    click_button "Next"
    expect(page).to have_content "Password can't be blank"
  end
end