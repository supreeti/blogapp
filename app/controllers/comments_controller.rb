class CommentsController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment created successfully'
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
