class PostsController < ApplicationController
  def index
    @params = params[:user_id]
    @user_by_id = User.find(@params)
    @posts_by_user = Post.where(author_id: @params)
    @comment_by_post = Comment.where(post: @posts_by_user)
    
  end

  def show
    @params_show = params[:id]
    @post_by_user= Post.where(author_id: params[:user_id], id: params[:id])
    @comment_by_post = Comment.where(post: @post_by_user)
  end
end
