class DoubtsController < ApplicationController
    before_action :require_login
  
    def create
        @tweet = Tweet.find(params[:tweet_id])
        @doubt = current_user.doubts.build(tweet: @tweet)

        if @doubt.save
            redirect_to tweets_url, notice: "ダウトに登録しました"
        else
            redirect_to tweets_url, alert: "このツイートはダウトに登録できません"
    end
  end

  def destroy
    @doubt = current_user.doubts.find_by!(tweet_id: params[:tweet_id])
    @doubt.destroy
    redirect_to tweets_url, notice: "ダウトを解除しました"
  end
end
