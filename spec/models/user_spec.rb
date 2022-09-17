require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Dino', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.') }
  before { subject.save }

  it 'Should has valid value' do
    expect(subject).to be_valid
  end

  it 'Should not allow blank name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostCounter should be an integer greater or equal to 0' do
    subject.posts_counter = 2
    expect(subject).to be_valid
  end

  it 'PostCounter should not be a negative number' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end

  it 'Three recent post length should be equal to 0' do
    expect(subject.last_post.length).to_not eq(3)
  end

  it 'Three recent post length should be equal to 3' do
    3.times do
      Post.create(title: 'example', text: 'example', author: subject)
    end
    expect(subject.last_post.length).to eq(3)
  end
end
