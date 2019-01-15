class DoctorUserSerializer < ActiveModel::Serializer
    attributes :id
    has_many :doctors, :users
  end