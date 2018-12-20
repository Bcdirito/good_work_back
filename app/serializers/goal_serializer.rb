class GoalSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  has_many :lists
end
