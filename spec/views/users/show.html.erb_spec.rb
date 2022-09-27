require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/150?img=8',
      bio: "Teacher from Mexico", posts_counter: 0)
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hello1', text: 'This is my second post')
    @third_post = Post.create(author: @user, title: 'Hello2', text: 'This is my third post')
    @fourth_post = Post.create(author: @user, title: 'Hello3', text: 'This is my fourth post')
    visit "/users/#{@user.id}"
  end

  it 'display the username profile picture' do
    expect(page).to have_xpath("//img[@src='#{@user.photo}']")
  end

  it 'display the username name' do
    expect(page).to have_content(@user.name)
  end
 
  it 'display the number of post the user has written' do
    expect(page).to have_content("Number of post: #{@user.posts_counter}")
  end

  it 'display the user bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'display user first 3 posts' do
    expect(page).to have_content(@second_post.text)
    expect(page).to_not have_content(@first_post.text)
  end

end