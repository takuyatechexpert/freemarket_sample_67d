class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 7..128

         has_many :items
         has_many :cards
         has_many :addresses
         accepts_nested_attributes_for :addresses, allow_destroy: true

         validates :nick_name,              presence: true, length: {maximum: 20}
         validates :email,                 presence: true, uniqueness: { case_sensitive: false }
         validates :family_name,           presence: true, length: {maximum: 35}
         validates :first_name,             presence: true, length: {maximum: 35}
         validates :family_name_kana,      presence: true, length: {maximum: 35}
         validates :first_name_kana,       presence: true, length: {maximum: 35}

end
