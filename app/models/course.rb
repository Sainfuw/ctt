class Course < ApplicationRecord
  has_many :inscriptions, dependent: :destroy
  has_many :users, through: :inscriptions
  has_many :messages, dependent: :destroy

  validates_presence_of :name

  def slug
    name.parameterize
  end
end
