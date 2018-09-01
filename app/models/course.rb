class Course < ApplicationRecord
  has_many :inscriptions

  validates_presence_of :name

  def slug
    name.parameterize
  end
end
