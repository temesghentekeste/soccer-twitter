module VoteHelper
  def upvoted?(opinion)
    user_signed_in? && current_user.upvoted_opinion_ids.include?(opinion.id) ? 'active' : ''
  end

  def downvoted?(opinion)
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
