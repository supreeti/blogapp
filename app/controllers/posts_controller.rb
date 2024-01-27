class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts
  end

  def show
    @users = User.find(params[:user_id])
    @post = @users.posts.find(params[:id])
  end
end
