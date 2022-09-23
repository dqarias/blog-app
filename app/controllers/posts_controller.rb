class PostsController < ApplicationController
  def index
    @params = params[:user_id]
    @user_by_id = User.find(@params)
    @post_by_user = Post.where(author_id: @params)
    @posts_by_user1 = Post.find_by(author_id: @params)
    @comments_by_user = @posts_by_user1.last_comments
  end

  def show
    @params_show = params[:id]
    @post_by_user = Post.where(author_id: params[:user_id], id: params[:id])
    @comment_by_post = Comment.where(post: @post_by_user)
  end
end
