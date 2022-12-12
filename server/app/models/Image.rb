class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :imageable, polymorphic: true
  # validates :src, presence: true
end
