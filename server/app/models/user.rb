class User < ApplicationRecord
  has_many :posts
  has_many :images, :as => :imageable
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  has_secure_password
  validates :password_confirmation, confirmation: true
end
