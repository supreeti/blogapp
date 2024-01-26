require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'returns the index template' do
      get users_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include('List of Users')
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = create(:user)
      get user_path(id: user.id)
      expect(response).to have_http_status(:success)
    end

    it 'returns the show template' do
      user = create(:user)
      get user_path(id: user.id)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      user = create(:user)
      get user_path(id: user.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Selected User')
    end
  end
end
