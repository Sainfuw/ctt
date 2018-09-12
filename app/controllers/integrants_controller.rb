class IntegrantsController < ApplicationController
  before_action :set_integrant, only: [:show, :edit, :update, :destroy]

  # GET /integrants
  # GET /integrants.json
  def index
    
  end

  # GET /integrants/1
  # GET /integrants/1.json
  def show
  end

  # GET /integrants/new
  def new
    @integrant = Integrant.new
  end

  # GET /integrants/1/edit
  def edit
  end

  # POST /integrants
  # POST /integrants.json
  def create
    @integrant = Integrant.new(integrant_params)

    respond_to do |format|
      if @integrant.save
        format.html { redirect_to @integrant, notice: 'Integrant was successfully created.' }
        format.json { render :show, status: :created, location: @integrant }
      else
        format.html { render :new }
        format.json { render json: @integrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /integrants/1
  # PATCH/PUT /integrants/1.json
  def update
    respond_to do |format|
      if @integrant.update(integrant_params)
        format.html { redirect_to @integrant, notice: 'Integrant was successfully updated.' }
        format.json { render :show, status: :ok, location: @integrant }
      else
        format.html { render :edit }
        format.json { render json: @integrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /integrants/1
  # DELETE /integrants/1.json
  def destroy
    @integrant.destroy
    respond_to do |format|
      format.html { redirect_to integrants_url, notice: 'Integrant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_integrant
      @integrant = Integrant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def integrant_params
      params.fetch(:integrant, {})
    end
end
