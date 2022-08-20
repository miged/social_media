require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should create tweet" do
    post "/tweet",
    params: { tweet: { body_text: "Test", user_id: 1 } }
    assert_response :success
  end

  test "should not create tweet if user doesn't exist" do
    post "/tweet",
    params: { tweet: { body_text: "Test", user_id: 999 } }
    assert_response 400
  end

  test "should not create empty tweet" do
    post "/tweet",
    params: { tweet: { body_text: "", user_id: 1 } }
    assert_response 400
  end

  test "should show all tweets" do
    get "/tweet"
    assert_response :success
  end

  test "should show tweet" do
    get "/tweet/1"
    assert_response :success
  end
end
