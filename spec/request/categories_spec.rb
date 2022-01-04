require 'rails_helper'

RSpec.describe 'Categories Routes', type: :request do
  login_user

#   before(:each) do
#     @user = FactoryBot.create(:user)
#     @category = FactoryBot.create(:category, user: @user)
#   end

  describe 'GET /index' do
    it 'renders a successful response' do
      get categories_url
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_url
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show' do 
    it 'renders a successful response' do
      category = FactoryBot.create(:category, user: @user)
      get category_url(category)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Category' do
        expect {
          post categories_url, params: { category: FactoryBot.attributes_for(:category) }
        }.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        post categories_url, params: { category: FactoryBot.attributes_for(:category) }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Category' do
        expect {
          post categories_url, params: { category: { name: nil } }
        }.to change(Category, :count).by(0)
      end

      it 'renders a successful response (i.e. to display the "new" template)' do
        post categories_url, params: { category: { name: nil } }
        expect(response).not_to be_successful
      end
    end
  end
  
  describe 'DELETE /destroy' do
    it 'destroys the requested category' do
      category = FactoryBot.create(:category, user: @user)
        expect {
          delete category_url(category)
        }.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories list' do
      category = FactoryBot.create(:category, user: @user)
      delete category_url(category)
      expect(response).to redirect_to(categories_url)
    end
  end
end