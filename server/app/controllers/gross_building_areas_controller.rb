class GrossBuildingAreasController < ApplicationController
  before_action :set_gross_building_area, only: [:show, :edit, :update, :destroy]

  # GET /gross_building_areas
  # GET /gross_building_areas.json
  def index
    @gross_building_areas = GrossBuildingArea.all
  end

  # GET /gross_building_areas/1
  # GET /gross_building_areas/1.json
  def show
  end

  # GET /gross_building_areas/new
  def new
    @gross_building_area = GrossBuildingArea.new
  end

  # GET /gross_building_areas/1/edit
  def edit
  end

  # POST /gross_building_areas
  # POST /gross_building_areas.json
  def create
    @gross_building_area = GrossBuildingArea.new(gross_building_area_params)

    respond_to do |format|
      if @gross_building_area.save
        format.html { redirect_to @gross_building_area, notice: 'Gross building area was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gross_building_area }
      else
        format.html { render action: 'new' }
        format.json { render json: @gross_building_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gross_building_areas/1
  # PATCH/PUT /gross_building_areas/1.json
  def update
    respond_to do |format|
      if @gross_building_area.update(gross_building_area_params)
        format.html { redirect_to @gross_building_area, notice: 'Gross building area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gross_building_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gross_building_areas/1
  # DELETE /gross_building_areas/1.json
  def destroy
    @gross_building_area.destroy
    respond_to do |format|
      format.html { redirect_to gross_building_areas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gross_building_area
      @gross_building_area = GrossBuildingArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gross_building_area_params
      params.require(:gross_building_area).permit(:measurement, :standard_name, :standard_version)
    end
end
