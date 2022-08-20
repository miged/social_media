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

  def update
    @tweet = Tweet.find(params[:id])

    if params[:user_id].to_i == @tweet.user_id
      @tweet.body_text = params[:body_text]
      @tweet.save

      render json: @tweet
    else
      head :forbidden
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])

    if params[:user_id].to_i == @tweet.user_id
      @tweet.destroy
      head 200
    else
      head :forbidden
    end
  end

  private
    def tweet_not_found
      head :not_found
    end
end
