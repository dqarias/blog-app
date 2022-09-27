require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before :each do
    first_user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/150?img=8',
      bio: "Teacher from Mexico", posts_counter: 0)
    second_user = User.create(name: 'Lilly', photo: 'https://i.pravatar.cc/150?img=5',
      bio: "Teacher from Poland", posts_counter: 0)
    third_user = User.create(name: 'Hans', photo: 'https://i.pravatar.cc/150?img=13',
      bio: "Teacher from Brazil", posts_counter: 0)
    @users = [first_user, second_user, third_user]
    visit users_path 
  end
  it 'display the username of all users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'display the profile picture for each user' do
    @users.each do |user|
      expect(page).to have_xpath("//img[@src='#{user.photo}']")
    end
  end

  it 'display the number of post for each user' do
    @users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  it 'changes to user profile after clicking on a card' do
    user = @users.first
    click_link(user.name.to_s)
    expect(page).to have_content('User:')
  end

end