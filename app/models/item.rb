class Item < ApplicationRecord

  belongs_to :user, optional: true
  has_many :images
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :price, presence: true

end
