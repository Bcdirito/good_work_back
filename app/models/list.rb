class List < ApplicationRecord
    belongs_to :goal
    has_many :tasks

    validates :name, presence: true
end
