class Following < ApplicationRecord
  before_save :generate_timestamp

 
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def generate_timestamp
    self.created_at = DateTime.now
    self.updated_at = DateTime.now
  end
end