class User < ApplicationRecord
  has_many :posts
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  has_secure_password
  validates :password_confirmation, confirmation: true
end
