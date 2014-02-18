class EnvironmentalSustainableDesignsController < ApplicationController
  before_action :set_environmental_sustainable_design, only: [:show, :edit, :update, :destroy]

  # GET /environmental_sustainable_designs
  # GET /environmental_sustainable_designs.json
  def index
    @environmental_sustainable_designs = EnvironmentalSustainableDesign.all
  end

  # GET /environmental_sustainable_designs/1
  # GET /environmental_sustainable_designs/1.json
  def show
  end

  # GET /environmental_sustainable_designs/new
  def new
    @environmental_sustainable_design = EnvironmentalSustainableDesign.new
  end

  # GET /environmental_sustainable_designs/1/edit
  def edit
  end

  # POST /environmental_sustainable_designs
  # POST /environmental_sustainable_designs.json
  def create
    @environmental_sustainable_design = EnvironmentalSustainableDesign.new(environmental_sustainable_design_params)

    respond_to do |format|
      if @environmental_sustainable_design.save
        format.html { redirect_to @environmental_sustainable_design, notice: 'Environmental sustainable design was successfully created.' }
        format.json { render action: 'show', status: :created, location: @environmental_sustainable_design }
      else
        format.html { render action: 'new' }
        format.json { render json: @environmental_sustainable_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /environmental_sustainable_designs/1
  # PATCH/PUT /environmental_sustainable_designs/1.json
  def update
    respond_to do |format|
      if @environmental_sustainable_design.update(environmental_sustainable_design_params)
        format.html { redirect_to @environmental_sustainable_design, notice: 'Environmental sustainable design was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @environmental_sustainable_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environmental_sustainable_designs/1
  # DELETE /environmental_sustainable_designs/1.json
  def destroy
    @environmental_sustainable_design.destroy
    respond_to do |format|
      format.html { redirect_to environmental_sustainable_designs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environmental_sustainable_design
      @environmental_sustainable_design = EnvironmentalSustainableDesign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environmental_sustainable_design_params
      params[:environmental_sustainable_design]
    end
end
