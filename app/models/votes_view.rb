class VotesView < Opinion


  scope :for_user, -> (id) do
    where(author_id: id)
  end
  
  scope :for_date_range, -> (start_date, end_date) do
    for_user(current_user.id).where(created_at: start_date.beginning_of_day..end_date.end_of_day)
  end

  def self.count_by_date(field, start_date, end_date)
    results = for_date_range(start_date, end_date)
                  

    new_result = {}
    results.each do |result| 
                date = result['created_at'].strftime('%Y-%m-%d')
                if(new_result[date])
                  new_result[date] += Integer(result[field])
                else
                  new_result[date] = Integer(result[field])
                end
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