require 'rails_helper'

RSpec.describe 'Root path', type: :feature do
  before do
    @user = FactoryBot.create(:user_with_categories)
    sign_in(@user)
  end

  scenario 'User can see categories' do
    visit root_path

    expect(page).to have_content 'Categories'
  end

  scenario 'User can see categories with icon' do
    visit root_path

    expect(page).to have_css 'img'
  end

  scenario 'User can see categories with name' do
    visit root_path

    @user.categories.each do |category|
      expect(page).to have_content category.name
    end
  end

  scenario 'User can navigate to the transaction page' do
    visit root_path

    item = @user.categories.first
    find("a[href='#{category_url(item)}']").click
    expect(page).to have_current_path(category_path(item))
  end

  scenario 'Can see "Add a new category" buttton' do
    visit root_path
    click_link 'Add a new category'
    expect(page).to have_current_path(new_category_path)
  end
end
