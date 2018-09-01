class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  KINDS = {
            teacher: "Profesor",
            student: "Alumno",
            assistant: "Ayudante"
          }
end
