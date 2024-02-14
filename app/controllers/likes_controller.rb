class LikesController < ApplicationController
  def new
    @like = Like.new
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(user_id: @user.id, post_id: @post.id)

    if @like.save
      @post.increment!(:like_counter)
      flash[:notice] = 'Like created successfully!'
    else
      flash[:alert] = 'An error occurred'
    end

    redirect_to user_posts_path(@user, @post)
  end
end
