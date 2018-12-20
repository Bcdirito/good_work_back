class List < ApplicationRecord
    belongs_to :goal
    has_many :tasks
end
