class Opinion < ApplicationRecord 
  belongs_to :author, class_name: 'User'
  has_many :votes
  validates :author_id, presence: true
  validates :text, presence: true, length: {maximum:140}
  default_scope { order(created_at: :desc) }

  def score 
    if self.upvotes > 0 || self.downvotes > 0
      self.upvotes > 0 ? self.upvotes - self.downvotes : self.downvotes * -1
    else
      0
    end
  end

  paginates_per 3


end