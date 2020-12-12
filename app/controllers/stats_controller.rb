class StatsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @count_by_date = PageView.count_by_date(7.days.ago, Date.today)
    @uniq_count_by_date = PageView.uniq_count_by_date(7.days.ago, Date.today)
    @followers = FollowingView.count_by_date('followed_id', 30.days.ago, Date.today)
    @following = FollowingView.count_by_date('follower_id', 30.days.ago, Date.today)
  end
 
end