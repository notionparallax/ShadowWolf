class GeoJsonsController < ApplicationController
  before_action :set_geo_json, only: [:show, :edit, :update, :destroy]

  # GET /geo_jsons
  # GET /geo_jsons.json
  def index
    @geo_jsons = GeoJson.all
  end

  # GET /geo_jsons/1
  # GET /geo_jsons/1.json
  def show
  end

  # GET /geo_jsons/new
  def new
    @geo_json = GeoJson.new
  end

  # GET /geo_jsons/1/edit
  def edit
  end

  # POST /geo_jsons
  # POST /geo_jsons.json
  def create
    @geo_json = GeoJson.new(geo_json_params)

    respond_to do |format|
      if @geo_json.save
        format.html { redirect_to @geo_json, notice: 'Geo json was successfully created.' }
        format.json { render action: 'show', status: :created, location: @geo_json }
      else
        format.html { render action: 'new' }
        format.json { render json: @geo_json.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geo_jsons/1
  # PATCH/PUT /geo_jsons/1.json
  def update
    respond_to do |format|
      if @geo_json.update(geo_json_params)
        format.html { redirect_to @geo_json, notice: 'Geo json was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @geo_json.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geo_jsons/1
  # DELETE /geo_jsons/1.json
  def destroy
    @geo_json.destroy
    respond_to do |format|
      format.html { redirect_to geo_jsons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geo_json
      @geo_json = GeoJson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geo_json_params
      params.require(:geo_json).permit(:lat, :lon, :boundary_points)
    end
end
