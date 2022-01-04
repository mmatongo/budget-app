require 'rails_helper'

RSpec.feature "New Category", type: :feature do
  login_user

  given(:category) { FactoryBot.build(:category) }

  scenario "User creates a new category" do
    visit new_category_path
    within("form") do
      fill_in "category_name", with: category.name
      fill_in "category_icon", with: category.icon
    end
    click_button "Save"
    expect(page).to have_current_path root_path
  end

  scenario "User creates a new category with invalid attributes" do
    visit new_category_path
    within("form") do
      fill_in "category_name", with: ""
      fill_in "category_icon", with: ""
    end
    click_button "Save"
    expect(page).to have_content "Icon can't be blank"
  end
end
