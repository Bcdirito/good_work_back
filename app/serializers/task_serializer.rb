class TaskSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :title, :content
end
