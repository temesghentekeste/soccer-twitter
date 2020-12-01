class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo, dependent: :destroy
  has_one_attached :cover_image, dependent: :destroy
    
  has_many :opinions, foreign_key: "author_id", dependent: :destroy

  has_many :active_followings, class_name: "Following", foreign_key:    "follower_id", dependent: :destroy
  has_many :passive_followings, class_name: "Following", foreign_key:    "followed_id", dependent: :destroy

  has_many :following, through: :active_followings, source: :followed
  has_many :followers, through: :passive_followings, source: :follower

  def follow(other)
    active_followings.create!(followed_id: other.id)
  end

  def unfollow(other)
    active_followings.find_by(followed_id: other.id).destroy
  end

  def following?(other)
    following.include?(other)
  end
end
