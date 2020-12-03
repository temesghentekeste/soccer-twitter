class PagesController < ApplicationController
  def index 

  end

  def home
    @opinion = Opinion.new
    @opinions = current_user.opinions.includes(:author).limit(10)
    # @not_following = User.all - current_user.following
  end
end