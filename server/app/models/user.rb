class User < ApplicationRecord
  has_many :posts
  has_one :image, as: :imageable, dependent: :destroy
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  has_secure_password
  validates :password_confirmation, confirmation: true
end
