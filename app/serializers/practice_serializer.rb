class PracticeSerializer < ActiveModel::Serializer
    attributes :id, :name, :address, :phone
    has_one :doctor
  end
  