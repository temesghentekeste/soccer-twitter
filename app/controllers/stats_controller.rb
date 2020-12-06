class StatsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index 
    @count_by_date = PageView.for_date_range(7.days.ago, Date.today).count_by_date
    @uniq_count_by_date = PageView.for_date_range(7.days.ago, Date.today).uniq_count_by_date
  end
 
end