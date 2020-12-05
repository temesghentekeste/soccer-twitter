class PageView < Impression
  scope :for_type, -> (type) do
    where(impressionable_type: type)
  end
  
  scope :for_date_range, -> (start_date, end_date) do
    where(created_at: start_date.to_date.beginning_of_day..end_date.to_date.end_of_day)
  end

  scope :count_by_date, -> () do
    group('date(created_at)').count
  end

  scope :uniq_count_by_date, -> () do
    select(:ip_address).distinct.group('date(created_at)').count
  end
end