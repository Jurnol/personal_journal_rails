
# require 'bcrypt'
class User < ApplicationRecord
  has_many :journals, dependent: :destroy
  has_many :entries, through: :journals
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password_confirmation, presence: true
  # may mess around with password length and required characters in the future
  # validates :password, length: {minimum: 6}

  has_secure_password
end
