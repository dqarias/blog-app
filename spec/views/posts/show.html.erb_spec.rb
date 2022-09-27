require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/150?img=8',
                        bio: 'Teacher from Mexico', posts_counter: 0)
    @user2 = User.create(name: 'Fabien', photo: 'https://i.pravatar.cc/150?img=8',
                         bio: 'Teacher from Aruba', posts_counter: 0)
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hello1', text: 'This is my second post')
    @first_comment = Comment.create(post: @first_post, author: @user, text: 'Hi Tom!')
    @second_comment = Comment.create(post: @first_post, author: @user2, text: 'Hi Dino!')
    @third_comment = Comment.create(post: @first_post, author: @user, text: 'Hi there!')
    @fourth_comment = Comment.create(post: @first_post, author: @user2, text: 'Hi Tom!')
    @first_like = Like.create(post: @first_post, author: @user)

    visit "/users/#{@user.id}/posts/#{@first_post.id}"
  end
  it 'show post title, post author, comments_counter and likes_counter' do
    expect(page).to have_content(@first_post.title)
    expect(page).to have_content(@first_post.author.name)
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  it 'shows post body, username of each commentor and comments' do
    expect(page).to have_content(@first_post.text)
    expect(page).to have_content(@first_comment.author.name)
    expect(page).to have_content(@second_comment.author.name)
    expect(page).to have_content(@third_comment.author.name)
    expect(page).to have_content(@fourth_comment.author.name)
    expect(page).to have_content(@first_comment.text)
    expect(page).to have_content(@second_comment.text)
    expect(page).to have_content(@third_comment.text)
    expect(page).to have_content(@fourth_comment.text)
  end
end
