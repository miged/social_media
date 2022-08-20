class TweetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :tweet_not_found

  def index
    @tweets = Tweet.all
    render json: @tweets
  end

  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet
  end

  def create
    @tweet = Tweet.new(params.require(:tweet).permit(:body_text, :user_id))

    if @tweet.save
      render json: @tweet
    else
      head 400
    end
  end

  private
    def tweet_not_found
      head 404
    end
end
