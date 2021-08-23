class RegistrationsController < ApplicationController
  def new
    @user = User.new
    redirect_to tweets_url if logged_in?
  end

  def create
    @user = User.new(params_user)
    @user.score_sum = 0

    if @user.save
      login(@user.email, @user.password)
      redirect_to new_sessions_url, notice: "アカウントを作成しました"
    else
      render :new
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
