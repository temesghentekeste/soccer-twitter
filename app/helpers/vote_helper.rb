module VoteHelper
  def is_upvoted opinion 
      user_signed_in? && current_user.upvoted_opinion_ids.include?(opinion.id) ? 'active' : ''
  end

  def is_downvoted opinion 
    user_signed_in? && current_user.downvoted_opinion_ids.include?(opinion.id) ? 'active' : ''
  end

  def score_status(score)
    if score.zero?
      'success'
    elsif score.positive?
      'primary-vote' 
    else
      'danger'
    end
  end
end