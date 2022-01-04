require 'rails_helper'

RSpec.feature 'New Payment', type: :feature do
  login_user

  before(:each) do
    @category = FactoryBot.create(:category, user: @user)
  end

  given(:payment) { FactoryBot.build(:payment) }

  scenario 'User creates a new payment' do
    visit new_payment_path
    within('form') do
      fill_in 'payment_name', with: payment.name
      fill_in 'payment_amount', with: payment.amount
      select @category.name
    end
    click_button 'Save'
    expect(page).to have_current_path category_path(@category)
  end

  scenario 'User creates a new payment with invalid attributes' do
    visit new_payment_path
    within('form') do
      fill_in 'payment_name', with: ''
      fill_in 'payment_amount', with: ''
    end
    click_button 'Save'
    expect(page).to have_content "Amount can't be blank"
  end
end
