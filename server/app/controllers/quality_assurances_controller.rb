class QualityAssurancesController < ApplicationController
  before_action :set_quality_assurance, only: [:show, :edit, :update, :destroy]

  # GET /quality_assurances
  # GET /quality_assurances.json
  def index
    @quality_assurances = QualityAssurance.all
  end

  # GET /quality_assurances/1
  # GET /quality_assurances/1.json
  def show
  end

  # GET /quality_assurances/new
  def new
    @quality_assurance = QualityAssurance.new
  end

  # GET /quality_assurances/1/edit
  def edit
  end

  # POST /quality_assurances
  # POST /quality_assurances.json
  def create
    @quality_assurance = QualityAssurance.new(quality_assurance_params)

    respond_to do |format|
      if @quality_assurance.save
        format.html { redirect_to @quality_assurance, notice: 'Quality assurance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quality_assurance }
      else
        format.html { render action: 'new' }
        format.json { render json: @quality_assurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quality_assurances/1
  # PATCH/PUT /quality_assurances/1.json
  def update
    respond_to do |format|
      if @quality_assurance.update(quality_assurance_params)
        format.html { redirect_to @quality_assurance, notice: 'Quality assurance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quality_assurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quality_assurances/1
  # DELETE /quality_assurances/1.json
  def destroy
    @quality_assurance.destroy
    respond_to do |format|
      format.html { redirect_to quality_assurances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quality_assurance
      @quality_assurance = QualityAssurance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quality_assurance_params
      params.require(:quality_assurance).permit(:notes)
    end
end
