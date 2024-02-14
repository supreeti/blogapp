require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Get /posts' do
    context 'Get #index' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         post_counter: 3)
      Post.create(title: 'Hello World', author: user)

      it 'returns a successful response' do
        get user_posts_path(user)
        expect(response).to have_http_status(200)
      end

      it 'returns the index template' do
        get user_posts_path(user)
        expect(response).to render_template(:index)
      end

      it 'includes correct placeholder text in the response body' do
        get user_posts_path(user)
        expect(response.body).to include('List of post for selected User')
      end
    end
  end
  describe 'GET /show/' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       post_counter: 3)
    post = Post.create(title: 'Hello World', author: user)

    it 'returns a successful response' do
      get user_posts_path(user, post)
      expect(response).to have_http_status(:success)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user, post)
      expect(response.body).to include('List of post for selected User')
    end
  end
end
