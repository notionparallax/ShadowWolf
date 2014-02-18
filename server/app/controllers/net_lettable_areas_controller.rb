class NetLettableAreasController < ApplicationController
  before_action :set_net_lettable_area, only: [:show, :edit, :update, :destroy]

  # GET /net_lettable_areas
  # GET /net_lettable_areas.json
  def index
    @net_lettable_areas = NetLettableArea.all
  end

  # GET /net_lettable_areas/1
  # GET /net_lettable_areas/1.json
  def show
  end

  # GET /net_lettable_areas/new
  def new
    @net_lettable_area = NetLettableArea.new
  end

  # GET /net_lettable_areas/1/edit
  def edit
  end

  # POST /net_lettable_areas
  # POST /net_lettable_areas.json
  def create
    @net_lettable_area = NetLettableArea.new(net_lettable_area_params)

    respond_to do |format|
      if @net_lettable_area.save
        format.html { redirect_to @net_lettable_area, notice: 'Net lettable area was successfully created.' }
        format.json { render action: 'show', status: :created, location: @net_lettable_area }
      else
        format.html { render action: 'new' }
        format.json { render json: @net_lettable_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net_lettable_areas/1
  # PATCH/PUT /net_lettable_areas/1.json
  def update
    respond_to do |format|
      if @net_lettable_area.update(net_lettable_area_params)
        format.html { redirect_to @net_lettable_area, notice: 'Net lettable area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @net_lettable_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net_lettable_areas/1
  # DELETE /net_lettable_areas/1.json
  def destroy
    @net_lettable_area.destroy
    respond_to do |format|
      format.html { redirect_to net_lettable_areas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_net_lettable_area
      @net_lettable_area = NetLettableArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def net_lettable_area_params
      params.require(:net_lettable_area).permit(:measurement, :standard_name, :standard_version)
    end
end
