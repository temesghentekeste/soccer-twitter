class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :set_initial_values


  def index 
    
  end

  def home
    
  end

  def profile 
    @user = User.includes(:opinions).find_by(username: params[:username])
  end

  private 
  def set_initial_values
    if user_signed_in?
      @opinion = Opinion.new
      @opinions = current_user.opinions.includes(:author).limit(10)
      @to_follow = User.where.not(id: current_user.id)- current_user.following 
    end
  end
end