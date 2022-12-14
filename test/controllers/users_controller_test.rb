require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    post "/register",
    params: { user: { username: "john", password_digest: "p@ssw0rd" } }
    assert_response :success

    @user = User.where(username: "john").first()
    assert @user
    assert_equal @user.to_json, @response.body
  end

  test "should not create a duplicate user" do
    post "/register",
    params: { user: { username: "jane", password_digest: "p@ssw0rd" } }
    assert_response :bad_request
  end

  test "should validate password when creating user" do
    post "/register",
    params: { user: { username: "john" } }
    assert_response :bad_request
  end

  test "should login user" do
    post "/login",
    params: { username: "jane", password_digest: "password123" }
    assert_response :success

    @user = User.where(username: "jane").first()
    assert_equal @user.to_json, @response.body
  end

  test "should not login user if password is wrong" do
    post "/login",
    params: { username: "jane", password_digest: "password" }
    assert_response :forbidden
  end
end
