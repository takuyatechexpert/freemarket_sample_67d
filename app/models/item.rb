class Item < ApplicationRecord
  has_many :comments
  has_many :images
  belongs_to :user
  belongs_to :brand, dependent: :delete
  belongs_to :category, dependent: :delete
end
