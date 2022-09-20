require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes the correct text on its body' do
      get '/users'
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /:id' do
    it 'returns http success' do
      new_user = User.create(name: 'Dino', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.')
      get "/users/#{new_user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'includes the correct text on its body' do
      get '/users/1'
      expect(response.body).to include('Here is an specific user')
    end
  end
end
