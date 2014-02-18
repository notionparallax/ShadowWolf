class BuildingPressReleasesController < ApplicationController
  before_action :set_building_press_release, only: [:show, :edit, :update, :destroy]

  # GET /building_press_releases
  # GET /building_press_releases.json
  def index
    @building_press_releases = BuildingPressRelease.all
  end

  # GET /building_press_releases/1
  # GET /building_press_releases/1.json
  def show
  end

  # GET /building_press_releases/new
  def new
    @building_press_release = BuildingPressRelease.new
  end

  # GET /building_press_releases/1/edit
  def edit
  end

  # POST /building_press_releases
  # POST /building_press_releases.json
  def create
    @building_press_release = BuildingPressRelease.new(building_press_release_params)

    respond_to do |format|
      if @building_press_release.save
        format.html { redirect_to @building_press_release, notice: 'Building press release was successfully created.' }
        format.json { render action: 'show', status: :created, location: @building_press_release }
      else
        format.html { render action: 'new' }
        format.json { render json: @building_press_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /building_press_releases/1
  # PATCH/PUT /building_press_releases/1.json
  def update
    respond_to do |format|
      if @building_press_release.update(building_press_release_params)
        format.html { redirect_to @building_press_release, notice: 'Building press release was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @building_press_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /building_press_releases/1
  # DELETE /building_press_releases/1.json
  def destroy
    @building_press_release.destroy
    respond_to do |format|
      format.html { redirect_to building_press_releases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_press_release
      @building_press_release = BuildingPressRelease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_press_release_params
      params.require(:building_press_release).permit(:date, :channel_list, :content, :author_login)
    end
end
