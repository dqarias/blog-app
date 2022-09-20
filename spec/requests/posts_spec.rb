require 'rails_helper'

RSpec.describe 'Users/:id/Posts', type: :request do

  describe 'GET /index' do

    before(:example) do
      newUser = User.create(name: 'Dino', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.')
      get "/users/#{newUser.id}/posts"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct text on its body' do
      expect(response.body).to include('Here is a list of post for a given user')
    end

  end

  describe 'GET /show' do
    before(:example) do
      new_user = User.create(name: 'Dino', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.')
      new_post = Post.create(author: new_user, title: 'Hello', text: 'This is my first post')
      get "/users/#{new_user.id}/posts/#{new_post.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct text on its body' do
      expect(response.body).to include('Here is an specific post for a given user')
    end

  end
end
