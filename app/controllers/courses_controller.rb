class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :info]
  before_action :authenticate_user!, except: :home

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    # Create room
    # response = Ov.request("api/sessions", "post", {customSessionId: @course.name,})

    # Subscribe to room
    response = Ov.request("api/tokens", "post", {session: @course.name})
    @token = response['token']
    # Get Token ID
    #.split("&")[1].split("=")[1]
  end

  def home
  end

  def info
    @list_course = Inscription.where("course_id = ?", @course.id)

    # @profesor_ins = Inscription.where("course_id = ? and kind = ?", @course.id, "Profesor")
    # @profesor = User.find(@profesor_ins[0].user_id)
    # @ayudantes_ins = Inscription.where("course_id = ? and kind = ?", @course.id, "Ayudante")
    # @ayudantes = @ayudantes_ins.map { |a| User.find(a.user_id) }
    # @alumnos_ins = Inscription.where("course_id = ? and kind = ?", @course.id, "Alumno")
    # @alumnos = @alumnos_ins.map { |a| User.find(a.user_id) }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
end
