class ListSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :goal
  has_many :tasks
end
