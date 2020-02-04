class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_date

  belongs_to :user, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :price, presence: true

end
