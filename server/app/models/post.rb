class Post < ApplicationRecord
  self.belongs_to_required_by_default = false
  belongs_to :user
  belongs_to :build_type
  belongs_to :car_model
  belongs_to :manufacture
  has_many :images, as: :imageable, autosave: true
  validates_associated :images

  validates :engine_power, presence: true, length: { maximum: 10 }
  validates :condition, presence: true
  validates :mileage, length: { maximum: 20 }
  validates :steering_position, presence: true
  validates :transmission, presence: true
  validates :year, presence: true
  validates :price, length: { maximum: 50 }
  validates :color, presence: true
  validates :vin, length: { maximum: 20 }
  validates :plate_number, presence: true, length: { maximum: 20 }
  validates :description, presence: true
  validates :phone, presence: { message: "can't be blank" }, length: { maximum: 20 }, 
                    format: { with: Constants::VAILD_PHONE_REGEX, message: "format is invalid" }
  validates :address, presence: true

end
