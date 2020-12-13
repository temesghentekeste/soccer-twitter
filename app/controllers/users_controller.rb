class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.includes(:opinions)
  end

  def show
    @user = User.find(params[:id])
    redirect_to profile_path(username: @user.username)
  end
end
