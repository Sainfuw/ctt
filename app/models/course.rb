class Course < ApplicationRecord
  has_many :inscriptions

  validates_presence_of :name
end
