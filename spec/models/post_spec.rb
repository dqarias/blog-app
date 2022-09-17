require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Dino', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.')
  subject { Post.new(author: first_user, title: 'Hello', text: 'This is my first post') }
  before { subject.save }

  it 'Should has valid value' do
    expect(subject).to be_valid
  end

  it 'Should not allow blank tittle' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not has a length greater than 250' do
    new_title = subject.title * 250
    subject.title = new_title
    expect(subject).to_not be_valid
  end

  it 'title should has a length less than 250' do
    expect(subject.title.length).to be < 250
  end

  it 'CommentsCounter should be an integer greater or equal to 0' do
    subject.comments_counter = 2
    expect(subject).to be_valid
  end

  it 'CommentsCounter should not be a negative number' do
    subject.comments_counter = -2
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be an integer greater or equal to 0' do
    subject.likes_counter = 2
    expect(subject).to be_valid
  end

  it 'LikesCounter should not be a negative number' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end

  it 'Five recent comments length should not be equal to 3' do
    expect(subject.last_comments.length).to_not eq(3)
  end

  it 'Five recent comments length should be equal to 3' do
    5.times do
      Comment.create(post: subject, author: first_user, text: 'Hi Tom!')
    end
    expect(subject.last_comments.length).to eq(5)
  end

  it 'Update Post Counter' do
    expect(subject.author.posts_counter).to be > 1
  end
end
