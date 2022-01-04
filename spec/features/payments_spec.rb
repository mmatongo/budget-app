require 'rails_helper'

RSpec.feature "Payments", type: :feature do
  login_user

  before(:each) do
    @category = FactoryBot.create(:category, user: @user)
    FactoryBot.build_list(:payment, 3, author: @user, category_ids: @category.id)
  end

  scenario "List all payments" do
    visit category_path(@category)
    @category.payments.each do |payment|
      expect(page).to have_content payment.name
      expect(page).to have_content payment.amount
    end
  end

  scenario "See the total amount of payments" do
    visit category_path(@category)
    expect(page).to have_content @category.total_amount
  end

  scenario "Create a new payment button" do
    visit category_path(@category)
    expect(page).to have_link "Add a new transaction"
    click_link "Add a new transaction"
    expect(page).to have_current_path new_payment_path
  end
end