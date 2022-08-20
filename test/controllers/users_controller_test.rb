require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    post "/register",
    params: { user: { username: "john", password_digest: "p@ssw0rd" } }
    assert_response :success

    post "/login",
    params: { username: "john", password_digest: "p@ssw0rd" }
    assert_response :success
  end

  test "should login user" do
    post "/login",
    params: { username: "jane", password_digest: "password123" }
    assert_response :success
  end

  test "should not create a duplicate user" do
    post "/register",
    params: { user: { username: "jane", password_digest: "p@ssw0rd" } }
    assert_response 400
  end

  test "should validate password when creating user" do
    post "/register",
    params: { user: { username: "john" } }
    assert_response 400
  end
end
