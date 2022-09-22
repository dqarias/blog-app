class PostsController < ApplicationController
  def index
    @params = params[:user_id]
    @user_by_id = User.find(@params)
    @post_by_user = Post.where(author_id: @params)
    @comment_by_post = Comment.where(post: @post_by_user)
    
  end

  def show; end
end
