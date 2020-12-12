class FollowingView < Following

  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end

 

  scope :for_user, -> (field, id) do
    column_name = field.to_s
    where("#{column_name} = ?", id)
  end
  
  scope :for_date_range, -> (field, start_date, end_date) do
    for_user(field, current_user.id).where(created_at: start_date.beginning_of_day..end_date.end_of_day)
  end

  def self.count_by_date(field, start_date, end_date)
    results = for_date_range(field, start_date, end_date)
                  .group('date(created_at)').count

    new_result = {}
    results.each do 
                |date, count| new_result[date.strftime('%Y-%m-%d')] = count
             end
    with_zeros(start_date, end_date, new_result)
  end
  

  def self.with_zeros(start_date, end_date, results_hash)
    date_range = (start_date.to_date..end_date.to_date).to_a.map do 
      |date| date.strftime('%Y-%m-%d')
    end

    hash_with_zeros = {}
    date_range.each do |date|
      hash_with_zeros[date] = results_hash[date] || 0
    end
    hash_with_zeros
  end
end