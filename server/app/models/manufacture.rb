class Manufacture < ApplicationRecord
  has_many :car_models
  has_many :posts
end
