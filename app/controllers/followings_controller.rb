class FollowingsController < ApplicationController
  def create 
    following = Following.new(followings_params)
    following.follower_id = current_user.id
    if following.save
      redirect_to profile_path(current_user.username)
    end
  end

  private 
    def followings_params
      params.require(:following).permit(:followed_id)
    end
end