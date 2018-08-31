class InscriptionsController < ApplicationController
  before_action :authenticate_user!

  def courses
    @courses = Inscription.where(user_id: current_user.id)
  end

  def ayudantes
    @curso = Inscription.where(course_id: params[:id])
    @ayudantes = @curso.where(kind: 'Ayudante')
  end

  def alumnos
    @curso = Inscription.where(course_id: params[:id])
    @alumnos = @curso.where(kind: 'Alumno')
  end

  def new
    @inscription = Inscription.create(user_id: current_user.id, course_id: params[:id], kind: "Alumno")
    redirect_to root_path, notice: 'Registro al curso completo'
  end
end
