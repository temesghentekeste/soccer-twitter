class FollowingsController < ApplicationController
  def create 
    following = Following.new(followings_params)
    following.follower_id = current_user.id
    followed = User.find(following.followed_id)
    if following.save
      flash[:notice] = "You have successfully followed #{followed.full_name}"
      redirect_to profile_path(followed.username)
    end
  end
  
  def destroy
    @following = Following.find(params[:id])
    followed = User.find(@following.followed_id)
    @following.destroy
    flash[:alert] = "You have successfully unfollowed #{followed.full_name}"
    redirect_to profile_path(followed.username)


  end

  private 
    def followings_params
      params.require(:following).permit(:followed_id)
    end
end