class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :info, :init_transmission]
  before_action :authenticate_user!, except: :home

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  def init_transmission
    response = Ov.request("api/sessions", "post", {customSessionId: @course.name})
    redirect_to courses_path
  end
  # GET /courses/1
  # GET /courses/1.json
  def show
    # Subscribe to room
    response = Ov.request("api/tokens", "post", {session: @course.name})
    if response.key?(:error)
      redirect_to courses_path, alert: "error #{response[:error]}"
    else
      @token = response['token']
    end

  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    # Create room

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
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
