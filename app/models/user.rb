class User < ApplicationRecord
  has_many :goals
  has_secure_password

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true
end
