class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_date

  belongs_to :user, optional: true
  has_many :images, foreign_key: :item_id, dependent: :destroy
  belongs_to :category, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, presence: true
  validates :description, presence: true
  validates :size, presence: true

  validates :category, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :region_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true

end

