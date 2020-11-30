class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo, dependent: :destroy
  has_one_attached :cover_image, dependent: :destroy
    
  has_many :opinions
end
