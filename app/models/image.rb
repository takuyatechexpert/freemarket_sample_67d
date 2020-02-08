class Image < ApplicationRecord
  belongs_to :item, optional: true

  validates :name, presence: true

  mount_uploader :image, ImageUploader
end
