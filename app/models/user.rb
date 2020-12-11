class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  validates :full_name, presence: true, length: { maximum: 50 }
  default_scope { order(created_at: :desc) }

  has_one_attached :photo, dependent: :destroy
  has_one_attached :cover_image, dependent: :destroy

  validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :cover_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

    
  has_many :opinions, foreign_key: "author_id", dependent: :destroy

  has_many :active_followings, class_name: "Following", foreign_key:    "follower_id", dependent: :destroy
  has_many :passive_followings, class_name: "Following", foreign_key:    "followed_id", dependent: :destroy

  has_many :following, through: :active_followings, source: :followed
  has_many :followers, through: :passive_followings, source: :follower

  has_many :votes

  is_impressionable
  
  def follow(other)
    active_followings.create!(followed_id: other.id)
  end

  def unfollow(other)
    active_followings.find_by(followed_id: other.id).destroy
  end

  def following?(other)
    following.include?(other)
  end

  def upvoted_opinion_ids
    self.votes.where(upvote: true).pluck(:opinion_id)
  end

  def downvoted_opinion_ids
    self.votes.where(upvote: false).pluck(:opinion_id)
  end

  paginates_per 2

 
end
