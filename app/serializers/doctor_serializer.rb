class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio
  has_many :practices
end
