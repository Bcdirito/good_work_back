class PartnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_one :user
end
