class Address < ApplicationRecord

  belongs_to :user,     optional: true
  validates :tel,           presence: true
  validates :address,           presence: true
end
