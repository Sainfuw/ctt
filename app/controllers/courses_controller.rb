class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :info, :init_transmission, :get_token]
  before_action :authenticate_user!, except: :home

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  def init_transmission
    response = Ov.request("api/sessions", "post", {customSessionId: @course.slug})
    redirect_to courses_path
  end
  # GET /courses/1
  # GET /courses/1.json
  def show
    # Subscribe to room
    @teacher = Inscription
                .where(user: current_user, 
                    course: @course, 
                    kind: :teacher
                  ).any?
    response = Ov.request("api/tokens", "post", {session: @course.slug})
    if response.key?(:error)
      redirect_to courses_inscriptions_path, alert: "error #{response[:error]}"
    else
      @token = response['token']
    end
  end

  def get_token
    response = Ov.request("api/tokens", "post", {session: @course.slug})
    @token = response['token']
    render json: @token.to_json
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
    @profesor = Inscription.where("course_id = ? and kind = ?", @course.id, 0)
    @asistants = Inscription.where("course_id = ? and kind = ?", @course.id, 2)
    @students = Inscription.where("course_id = ? and kind = ?", @course.id, 1)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end
end
