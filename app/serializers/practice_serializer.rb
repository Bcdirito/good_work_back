class PracticeSerializer < ActiveModel::Serializer
    attributes :id, :name, :bio
    has_one :doctor
  end
  