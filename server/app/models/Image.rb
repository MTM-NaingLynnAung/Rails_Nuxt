class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :imageable, polymorphic: true
  validates :src, presence: { message: "Image can't be blank" }
  validate :image_size

  def image_size
    if src.size > 1.megabytes
      errors.add(:src, "Image should be less than 1MB")
    end
  end
end
