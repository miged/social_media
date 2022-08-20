require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    post "/register",
    params: { user: { username: "john", password_digest: "p@ssw0rd" } }
    assert_response :success

    @user = User.where(username: "john").first()
    assert @user
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
    params: { username: "jane", password: "password123" }
    assert_response :success
  end

  test "should not login user if password is wrong" do
    post "/login",
    params: { username: "jane", password: "password" }
    assert_response :forbidden
  end
end
