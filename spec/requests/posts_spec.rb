require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index/:user_id/posts' do
    let(:user) { User.create(name: 'Test User') }

    before do
      get "/users/#{user.id}/posts"
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'returns the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('List of post for selected User')
    end
  end

  describe 'GET /show/:user_id/posts/:id' do
    let(:user) { User.create(name: 'Test User') }
    let(:post) { user.posts.create(title: 'Test Post', text: 'Test Content') }

    before do
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Selected post for a user')
    end
  end
end
