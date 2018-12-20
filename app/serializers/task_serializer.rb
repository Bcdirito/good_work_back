class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_one :list
end
