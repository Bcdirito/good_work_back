class PartnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :users
end
