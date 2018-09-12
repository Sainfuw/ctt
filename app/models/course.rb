class Course < ApplicationRecord
  has_many :inscriptions
  has_many :users, through: :inscriptions

  validates_presence_of :name

  def slug
    name.parameterize
  end
end
