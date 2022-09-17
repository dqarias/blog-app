require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Dino', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.')
  post = Post.create(author: user, title: 'Hello', text: 'This is my first post')
  subject { Comment.create(post: post, author: user, text: 'Hi Tom!' ) }

  it 'Update comments counter' do
    expect(subject.post.comments_counter).to be 1
    Comment.create(post: post, author: user, text: 'Hi Tom!')
    expect(subject.post.comments_counter).to be 2
  end
end