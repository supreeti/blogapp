class PostsController < ApplicationController
  before_action :set_user
  before_action :post_params, only: [:create]

  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post was Successfully created'
      redirect_to user_posts_path(current_user, @post)
    else
      flash[:error] = 'Error: post could not be saved'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
