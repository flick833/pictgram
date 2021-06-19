class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{8,32}\z/i
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX } 
  validates :password_confirmation, presence: true, format: { with: VALID_PASSWORD_REGEX }
  
  has_secure_password
  
  has_many :topics
end