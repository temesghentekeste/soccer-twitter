class StatsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @count_by_date = PageView.count_by_date(7.days.ago, Date.today)
    @uniq_count_by_date = PageView.uniq_count_by_date(7.days.ago, Date.today)

    date_range = [ 30.days.ago, Date.today] 
    @followers = FollowingView.count_by_date('followed_id', date_range.first, date_range.last)
    @following = FollowingView.count_by_date('follower_id',  date_range.first, date_range.last)

    @upvotes = VotesView.count_by_date('upvotes', date_range.first, date_range.last)
    @downvotes = VotesView.count_by_date('downvotes', date_range.first, date_range.last)

  end
 
end