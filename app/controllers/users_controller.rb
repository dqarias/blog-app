class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @params = params[:id]
    @user_by_id = User.find(@params)
    @post_by_user = @user_by_id.last_post
  end
end
