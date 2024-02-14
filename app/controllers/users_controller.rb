class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @comments = Comment
    @likes = Like.all
  end
end
