class User < ApplicationRecord
  belongs_to :partner
  has_many :goals
end
