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

    if !@tweet.save
      return head :bad_request
    end

    render json: @tweet
  end

  def update
    @tweet = Tweet.find(params[:id])

    # check if user matches
    if params[:user_id].to_i != @tweet.user_id
      return head :forbidden
    end

    @tweet.body_text = params[:body_text]
    @tweet.save
    render json: @tweet
  end

  def destroy
    @tweet = Tweet.find(params[:id])

    # check if user matches
    if params[:user_id].to_i != @tweet.user_id
      return head :forbidden
    end

    @tweet.destroy
    head :ok
  end

  private
    def tweet_not_found
      head :not_found
    end
end
