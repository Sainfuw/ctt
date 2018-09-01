class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum kinds: [ :teacher, :student, :assistant ]
end
