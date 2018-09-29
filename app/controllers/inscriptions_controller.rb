class InscriptionsController < ApplicationController
  before_action :authenticate_user!

  def courses
    @inscriptions = Inscription.where(user_id: current_user.id)
  end

  def ayudantes
    @curso = Inscription.where(course_id: params[:id])
    @ayudantes = @curso.where(kind: 'Ayudante')
  end

  def alumnos
    @curso = Inscription.where(course_id: params[:id])
    @alumnos = @curso.where(kind: 'Alumno')
  end

  def create
    @course_user = @course.inscriptions.where(user_id: current_user.id).first_or_create
    if helpers.get_inscription(current_user, Course.find(params[:course_id])).nil?
      @inscription = Inscription.new(user_id: current_user.id, course_id: params[:course_id])
      @inscription.student!
      @inscription.save
      redirect_to root_path, notice: 'Registro al curso completo'
    else
      redirect_to root_path, notice: 'Ya estas inscrito en este curso'
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
  def inscription_params
    params.require(:inscription).permit(:course_id)
  end
end
