class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(user: @user, post: @post)

    if @like.save
      @post.increment!(:like_counter)
      flash[:notice] = 'Like created successfully!'
    else
      flash[:alert] = 'An error occurred'
    end

    redirect_to user_posts_path(user_id: @post.author_id, id: @post.id)
  end
end
