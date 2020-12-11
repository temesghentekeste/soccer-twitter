class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page params[:page]
    @users = @users.includes(:opinions)
  end

  def show
    @user = User.find(params[:id])
    redirect_to profile_path(username: @user.username)
  end
end
