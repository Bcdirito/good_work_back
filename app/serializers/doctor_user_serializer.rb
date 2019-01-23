class DoctorUserSerializer < ActiveModel::Serializer
    attributes :id
    has_many :doctors 
    has_many :users
  end