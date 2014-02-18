class BuildingPressesController < ApplicationController
  before_action :set_building_press, only: [:show, :edit, :update, :destroy]

  # GET /building_presses
  # GET /building_presses.json
  def index
    @building_presses = BuildingPress.all
  end

  # GET /building_presses/1
  # GET /building_presses/1.json
  def show
  end

  # GET /building_presses/new
  def new
    @building_press = BuildingPress.new
  end

  # GET /building_presses/1/edit
  def edit
  end

  # POST /building_presses
  # POST /building_presses.json
  def create
    @building_press = BuildingPress.new(building_press_params)

    respond_to do |format|
      if @building_press.save
        format.html { redirect_to @building_press, notice: 'Building press was successfully created.' }
        format.json { render action: 'show', status: :created, location: @building_press }
      else
        format.html { render action: 'new' }
        format.json { render json: @building_press.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /building_presses/1
  # PATCH/PUT /building_presses/1.json
  def update
    respond_to do |format|
      if @building_press.update(building_press_params)
        format.html { redirect_to @building_press, notice: 'Building press was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @building_press.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /building_presses/1
  # DELETE /building_presses/1.json
  def destroy
    @building_press.destroy
    respond_to do |format|
      format.html { redirect_to building_presses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_press
      @building_press = BuildingPress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_press_params
      params[:building_press]
    end
end
