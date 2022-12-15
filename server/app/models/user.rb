class User < ApplicationRecord
  has_many :posts
  has_one :image, as: :imageable
  accepts_nested_attributes_for :image, update_only: true
  validates_associated :image
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true, presence: true
  has_secure_password
  
  with_options on: [:uploaded] do
    validates :password, presence: true
  end
  # validates :password, presence: true
  validates :password_confirmation, confirmation: true
  validates :phone, length: { maximum: 20 }, 
                    format: { with: Constants::VAILD_PHONE_REGEX, message: "format is invalid" }, :if => lambda { |user| user.phone.present? }

                    
end
