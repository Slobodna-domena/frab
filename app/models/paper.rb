class Paper < ApplicationRecord
  has_many :grades
  belongs_to :event
end
