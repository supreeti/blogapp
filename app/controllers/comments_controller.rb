class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment.user_id = @user.id
    @comment.post_id = @post.id

    if @comment.save
      @comment.update_comment_counter
      redirect_to user_posts_path(@user, @posts)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
