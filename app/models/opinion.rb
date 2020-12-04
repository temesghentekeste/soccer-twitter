class Opinion < ApplicationRecord 
  belongs_to :author, class_name: 'User'
  has_many :votes
  validates :author_id, presence: true
  validates :text, presence: true, length: {maximum:140}
  default_scope { order(created_at: :desc) }

end