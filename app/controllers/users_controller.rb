class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit(:username, :password_digest))

    if @user.save
      session[:user_id] = @user.id
      render json: @user
    else
      head 400
    end
  end

  def login
    @user = User.where(username: params[:username], password_digest: params[:password_digest]).first()

    if @user
      session[:user_id] = @user.id
      render json: @user
    else
      head 403
    end
  end
end
