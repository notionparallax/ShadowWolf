class FootprintAreasController < ApplicationController
  before_action :set_footprint_area, only: [:show, :edit, :update, :destroy]

  # GET /footprint_areas
  # GET /footprint_areas.json
  def index
    @footprint_areas = FootprintArea.all
  end

  # GET /footprint_areas/1
  # GET /footprint_areas/1.json
  def show
  end

  # GET /footprint_areas/new
  def new
    @footprint_area = FootprintArea.new
  end

  # GET /footprint_areas/1/edit
  def edit
  end

  # POST /footprint_areas
  # POST /footprint_areas.json
  def create
    @footprint_area = FootprintArea.new(footprint_area_params)

    respond_to do |format|
      if @footprint_area.save
        format.html { redirect_to @footprint_area, notice: 'Footprint area was successfully created.' }
        format.json { render action: 'show', status: :created, location: @footprint_area }
      else
        format.html { render action: 'new' }
        format.json { render json: @footprint_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /footprint_areas/1
  # PATCH/PUT /footprint_areas/1.json
  def update
    respond_to do |format|
      if @footprint_area.update(footprint_area_params)
        format.html { redirect_to @footprint_area, notice: 'Footprint area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @footprint_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /footprint_areas/1
  # DELETE /footprint_areas/1.json
  def destroy
    @footprint_area.destroy
    respond_to do |format|
      format.html { redirect_to footprint_areas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_footprint_area
      @footprint_area = FootprintArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def footprint_area_params
      params.require(:footprint_area).permit(:measurement, :standard_name, :standard_version)
    end
end
