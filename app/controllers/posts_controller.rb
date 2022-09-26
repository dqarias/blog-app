class PostsController < ApplicationController
  def index
    @params = params[:user_id]
    @user_by_id = User.find(@params)
    @post_by_user = Post.where(author_id: @params).includes(:author)
    @posts_by_user1 = Post.find_by(author_id: @params)
    @comments_by_user = @posts_by_user1.last_comments.includes(:author)
  end

  def show
    @params_show = params[:id]
    @post_by_user = Post.where(author_id: params[:user_id], id: params[:id])
    @comment_by_post = Comment.where(post: @post_by_user).includes(:author)
  end

  def new
    @post_new = Post.new
  end

  def create
    @user = current_user
    @post_new = @user.posts.new(post_params)

    if @post_new.save
      redirect_to user_posts_path(@user.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
