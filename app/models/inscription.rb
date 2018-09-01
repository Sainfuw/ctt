class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum kind: [ :teacher, :student, :assistant ]
end
