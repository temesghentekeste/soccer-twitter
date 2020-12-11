class OpinionsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to profile_path(current_user.username)
  end

  def new
    @opinion = current_user.opinions.build
  end

  def create
    opinion = current_user.opinions.build(opinion_params)
    if opinion.save
      flash[:notice] = 'Your soccer tweet was successfully created'
      redirect_to home_path
    else
      redirect_to home_path, alert: opinion.errors.full_messages
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:user_id, :text)
  end
end
