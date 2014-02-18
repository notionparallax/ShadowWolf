class GrossFloorAreasController < ApplicationController
  before_action :set_gross_floor_area, only: [:show, :edit, :update, :destroy]

  # GET /gross_floor_areas
  # GET /gross_floor_areas.json
  def index
    @gross_floor_areas = GrossFloorArea.all
  end

  # GET /gross_floor_areas/1
  # GET /gross_floor_areas/1.json
  def show
  end

  # GET /gross_floor_areas/new
  def new
    @gross_floor_area = GrossFloorArea.new
  end

  # GET /gross_floor_areas/1/edit
  def edit
  end

  # POST /gross_floor_areas
  # POST /gross_floor_areas.json
  def create
    @gross_floor_area = GrossFloorArea.new(gross_floor_area_params)

    respond_to do |format|
      if @gross_floor_area.save
        format.html { redirect_to @gross_floor_area, notice: 'Gross floor area was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gross_floor_area }
      else
        format.html { render action: 'new' }
        format.json { render json: @gross_floor_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gross_floor_areas/1
  # PATCH/PUT /gross_floor_areas/1.json
  def update
    respond_to do |format|
      if @gross_floor_area.update(gross_floor_area_params)
        format.html { redirect_to @gross_floor_area, notice: 'Gross floor area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gross_floor_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gross_floor_areas/1
  # DELETE /gross_floor_areas/1.json
  def destroy
    @gross_floor_area.destroy
    respond_to do |format|
      format.html { redirect_to gross_floor_areas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gross_floor_area
      @gross_floor_area = GrossFloorArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gross_floor_area_params
      params.require(:gross_floor_area).permit(:measurement, :standard_name, :standard_version)
    end
end
