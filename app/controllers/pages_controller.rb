class PagesController < ApplicationController
  def index 

  end

  def welcome
    @opinions = Opinion.all
    if user_signed_in?
      @newOpinion = current_user.opinions.build
    end
  end
end