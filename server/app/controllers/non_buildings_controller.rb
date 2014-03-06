class NonBuildingsController < ApplicationController
  before_action :set_non_building, only: [:show, :edit, :update, :destroy]

  # GET /non_buildings
  # GET /non_buildings.json
  def index
    @non_buildings = NonBuilding.all
  end

  # GET /non_buildings/1
  # GET /non_buildings/1.json
  def show
  end

  # GET /non_buildings/new
  def new
    @non_building = NonBuilding.new
  end

  # GET /non_buildings/1/edit
  def edit
  end

  # POST /non_buildings
  # POST /non_buildings.json
  def create
    @non_building = NonBuilding.new(non_building_params)

    respond_to do |format|
      if @non_building.save
        format.html { redirect_to @non_building, notice: 'Non building was successfully created.' }
        format.json { render action: 'show', status: :created, location: @non_building }
      else
        format.html { render action: 'new' }
        format.json { render json: @non_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /non_buildings/1
  # PATCH/PUT /non_buildings/1.json
  def update
    respond_to do |format|
      if @non_building.update(non_building_params)
        format.html { redirect_to @non_building, notice: 'Non building was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @non_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /non_buildings/1
  # DELETE /non_buildings/1.json
  def destroy
    @non_building.destroy
    respond_to do |format|
      format.html { redirect_to non_buildings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_building
      @non_building = NonBuilding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def non_building_params
      params.require(:non_building).permit(:name, :description)
    end
end
