class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = Comment.new(comment_params)
    @comment.author_id = @user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(@user.id, Post.find(params[:post_id]))
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author, :post)
  end
end
