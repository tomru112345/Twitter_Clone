class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]
  
  before_action :require_login
  
  # GET /users or /users.json
  def index
    #@users = User.page(params[:page]).per(5)
    @users = User.all.page(params[:page]).per(5)
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page]).per(5)
  end

  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorites.page(params[:page]).per(5)
  end
  
  def follows
    @user = User.find(params[:id])
    @follows = @user.inverse_followers.page(params[:page]).per(5)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(5)
  end 
end