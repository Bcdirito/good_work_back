class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name 
  has_many :goals
  has_many :doctors, through: :doctor_users
end
