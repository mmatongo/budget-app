require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  login_user

  describe 'GET /payments' do
    it 'renders a successful response' do
      get new_payment_url
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /payments' do
    context 'with valid params' do
      it 'creates a new Payment' do
        expect do
          post payments_url,
               params: { payment: FactoryBot.attributes_for(:payment, category_ids: [FactoryBot.create(:category).id]) }
        end.to change(Payment, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Payment' do
        expect do
          post payments_url, params: { payment: FactoryBot.attributes_for(:payment, name: nil) }
        end.to change(Payment, :count).by(0)
      end

      it 'renders a successful response' do
        post payments_url, params: { payment: FactoryBot.attributes_for(:payment, name: nil) }
        expect(response).not_to be_successful
      end
    end
  end
end
