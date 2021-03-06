class User < ApplicationRecord
  has_many :goals
  has_many :doctor_users
  has_many :doctors, through: :doctor_users
  has_one :partner
  has_secure_password

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
