class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]
  
  before_action :require_login
  
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  def favorites
    @user = User.find(params[:id])
  end 
end
