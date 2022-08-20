class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit(:username, :password_digest))

    if !@user.save
      return head :bad_request
    end

    session[:user_id] = @user.id
    render json: @user
  end

  def login
    @user = User.where(username: params[:username], password_digest: params[:password_digest]).first()

    if !@user
      return head :forbidden
    end

    session[:user_id] = @user.id
    render json: @user
  end
end
