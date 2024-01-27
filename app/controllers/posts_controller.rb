class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts
  end

  def show
    @users = User.find(params[:user_id])
    @posts = @users.posts.find(params[:id])
  end

  def new
    @users = User.find(params[:user_id])
    @posts = Post.new
  end

  def create
    @posts = Post.new(posts_params)
    @posts.author = current_user

    if @posts.save
      redirect_to user_post_path(user_id: current_user.id, id: @posts.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
