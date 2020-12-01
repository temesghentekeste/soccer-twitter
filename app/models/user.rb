class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo, dependent: :destroy
  has_one_attached :cover_image, dependent: :destroy
    
  has_many :opinions, foreign_key: "author_id", dependent: :destroy

  has_many :active_Followings, class_name: "Following", foreign_key:    "follower_id", dependent: :destroy
  has_many :passive_Followings, class_name: "Following", foreign_key:    "followed_id", dependent: :destroy

  has_many :following, through: :active_Followings, source: :followed
  has_many :followers, through: :passive_Followings, source: :follower
end
