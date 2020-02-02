class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :price, presence: true

end
