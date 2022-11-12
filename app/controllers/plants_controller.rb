class PlantsController < ApplicationController
    # GET /plants
    def index
      plants = Plant.all
      render json: plants
    end
  
    # POST /plants
    def create
      plants = Plant.create(plant_params)
      render json: plants, status: :created
    end
  
    # GET /plants/:id
    def show
      plants = Plant.find_by(id: params[:id])
      if plants
        render json: plants
      else
        render json: { error: "Bird not found" }, status: :not_found
      end
    end
  
    private
  
    def plant_params
      params.permit(:name, :image, :price)
    end
end