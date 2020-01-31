class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 7..128

         has_many :items
         has_many :cards
         has_many :addresses

         validates :nick_name,              presence: true, length: {maximum: 20}
         validates :email,                 presence: true, uniqueness: { case_sensitive: false }
         validates :password,              presence: true, length: {minimum: 7, maximum: 128}
         validates :family_name,           presence: true, length: {maximum: 35}
         validates :first_name,             presence: true, length: {maximum: 35}
         validates :family_name_kana,      presence: true, length: {maximum: 35}
         validates :first_name_kana,       presence: true, length: {maximum: 35}
        #  validates :birthday,              presence: true
end
