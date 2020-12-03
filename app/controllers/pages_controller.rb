class PagesController < ApplicationController
  def index 

  end

  def home
    @opinion = Opinion.new
    # @posts = Post.order('created_at DESC').includes(:user, :likes).limit(10)
    # @not_following = User.all - current_user.following
  end
end