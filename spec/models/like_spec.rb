require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Dino', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.')
  post = Post.create(author: user, title: 'Hello', text: 'This is my first post')
  subject { Like.create(post:, author: user) }

  it 'Update likes counter' do
    expect(subject.post.likes_counter).to be 1
    Like.create(post:, author: user)
    expect(subject.post.likes_counter).to be 2
  end
end
