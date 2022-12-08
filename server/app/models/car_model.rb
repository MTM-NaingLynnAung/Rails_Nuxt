class CarModel < ApplicationRecord
  belongs_to :manufacture
  has_many :posts
end
