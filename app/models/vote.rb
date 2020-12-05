class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates_uniqueness_of :user_id, scope: :opinion_id

  after_create :increment_vote
  after_destroy :decrement_vote

  private
    def increment_vote
      field = self.upvote ? :upvotes : :downvotes
      Opinion.find(self.opinion_id).increment(field).save
    end
    
    def decrement_vote
      field = self.upvote ? :upvotes : :downvotes
      Opinion.find(self.opinion_id).decrement(field).save
    end
end