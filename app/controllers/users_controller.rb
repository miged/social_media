class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit(:username, :password_digest))
    session[:user_id] = @user.id

    if @user.save
      render json: @user
    else
      head 400
    end
  end
end
