require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/150?img=8',
      bio: "Teacher from Mexico", posts_counter: 0)
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hi', text: 'This is my second post')
    @first_comment = Comment.create(post: @first_post, author: @user, text: 'Hi Tom!' )
    @second_comment = Comment.create(post: @first_post, author: @user, text: 'Hi Tom!' )
    @third_comment = Comment.create(post: @first_post, author: @user, text: 'Hi Tom!' )
    @fourth_comment = Comment.create(post: @first_post, author: @user, text: 'Hi Tom!' )
    @first_like = Like.create(post: @first_post, author: @user)

    visit "/users/#{@user.id}/posts"
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

  it 'display the a post title' do
    expect(page).to have_content(@first_post.title)
  end

  it 'display some post body' do
    expect(page).to have_content(@first_post.text)
    expect(page).to have_content(@second_post.text)
  end

  it 'display first comments on a post' do
    expect(page).to have_content(@first_comment.text)
    expect(page).to have_content(@second_comment.text)
  end

  it 'display comments_counter' do
    expect(page).to have_content(@first_post.comments_counter)
  end

  it 'display likes_counter' do
    expect(page).to have_content(@first_post.likes_counter)
  end

  it 'section for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'changes to post show page after clicking on a post' do
    click_link(@first_post.title)
    expect(page).to have_content('Specific Post by user:')
  end

end