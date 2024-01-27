class PostsController < ApplicationController
  before_action :set_users, only: %i[index show new]

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
    @post = current_user.posts.new(post_params)
    @user = current_user

    if @post.save
      flash[:success] = 'Post was Successfully created'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Error: post could not be saved'
      render :new
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end

  def set_users
    @user = User.find(params[:user_id])
  end
end
