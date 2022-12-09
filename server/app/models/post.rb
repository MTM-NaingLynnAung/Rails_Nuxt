class Post < ApplicationRecord
  belongs_to :user
  belongs_to :build_type
  belongs_to :car_model
  belongs_to :manufacture
  has_many :images, :as => :imageable
  validates :condition, presence: true
  validates :steering_position, presence: true
  validates :transmission, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :plate_number, presence: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :address, presence: true
end
