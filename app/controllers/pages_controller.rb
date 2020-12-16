class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :set_initial_values

  def index; end

  def home; end

  def discover; end

  def connect
    @users = User.all.order(created_at: :desc)
  end

  def profile
    @user = User.includes(:opinions).find_by(username: params[:username])
    impressionist(@user) unless @user == current_user || @user.nil?
    @following = Following.new
  end

  private

  def set_initial_values
    return unless user_signed_in?

    @opinions = Opinion.page params[:page]
    @opinions = @opinions.all.includes(:author)
    @opinion = Opinion.new
    @to_follow = User.where.not(id: current_user.id) - current_user.following
  end
end
