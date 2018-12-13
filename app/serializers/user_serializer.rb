class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email
  has_one :partner
  has_many :goals
end
