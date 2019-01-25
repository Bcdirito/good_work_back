class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :image
  has_many :practices
  has_many :users, through: :doctor_users
end
