require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should create tweet" do
    post "/tweet",
    params: { tweet: { body_text: "Test", user_id: 1 } }
    assert_response :success

    @tweet = Tweet.where(body_text: "Test").first()
    assert @tweet
    assert_equal @tweet.to_json, @response.body
  end

  test "should not create tweet if user doesn't exist" do
    post "/tweet",
    params: { tweet: { body_text: "Test", user_id: 999 } }
    assert_response :bad_request
  end

  test "should not create empty tweet" do
    post "/tweet",
    params: { tweet: { body_text: "", user_id: 1 } }
    assert_response :bad_request
  end

  test "should show all tweets" do
    get "/tweet"
    assert_response :success

    @tweets = Tweet.all
    assert_equal @tweets.to_json, @response.body
  end

  test "should show tweet" do
    get "/tweet/1"
    assert_response :success

    @tweet = Tweet.find(1)
    assert_equal @tweet.to_json, @response.body
  end

  test "should update tweet" do
    put "/tweet/1",
    params: { body_text: "Test", user_id: 1 }
    assert_response :success

    @tweet = Tweet.find(1)
    assert_equal @tweet.body_text, "Test"
  end

  test "should not update tweet if user doesn't match" do
    put "/tweet/1",
    params: { body_text: "Test", user_id: 2 }
    assert_response :forbidden

    @tweet = Tweet.find(1)
    assert_not_equal @tweet.body_text, "Test"
  end

  test "should delete tweet" do
    delete "/tweet/1",
    params: { user_id: 1 }
    assert_response :success

    get "/tweet/1"
    assert_response :not_found
  end

  test "should not delete tweet if user doesn't match" do
    delete "/tweet/1",
    params: { user_id: 2 }
    assert_response :forbidden

    get "/tweet/1"
    assert_response :success
  end
end
