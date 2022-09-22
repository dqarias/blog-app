class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @params = params[:id]
    @user_by_id = User.find(@params)
    @post_by_user = Post.where(author_id: @params)
  end
end
