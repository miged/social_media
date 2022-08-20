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
    @user = User.where(username: params[:username], password_digest: params[:password]).first()

    if @user
      session[:user_id] = @user.id
      render json: @user
    else
      head :forbidden
    end
  end
end
