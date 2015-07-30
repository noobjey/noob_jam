class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    user = User.find_by(username: params[:user][:username])
    redirect_to user_path(user.id)
  end

  def show
    @user = User.find_by(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
