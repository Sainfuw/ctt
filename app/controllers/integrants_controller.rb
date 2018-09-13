class IntegrantsController < ApplicationController
  
  # GET /integrants
  # GET /integrants.json
  def index
    @back_team = Integrant.back_team
    @front_team = Integrant.front_team
    @streaming_team = Integrant.streaming_team
  end
end
