require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      newUser = User.create(name: 'Dino', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.')
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
