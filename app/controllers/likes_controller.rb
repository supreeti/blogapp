class LikesController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]

  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user_id: current_user.id, post_id: @post.id)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'You liked this post!'
    else
      redirect_to user_post_path(@user, @post), alert: 'Unable to like this post.'
    end
  end

  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end
