class ProfessionalContributionsController < ApplicationController
  before_action :set_professional_contribution, only: [:show, :edit, :update, :destroy]

  # GET /professional_contributions
  # GET /professional_contributions.json
  def index
    @professional_contributions = ProfessionalContribution.all
  end

  # GET /professional_contributions/1
  # GET /professional_contributions/1.json
  def show
  end

  # GET /professional_contributions/new
  def new
    @professional_contribution = ProfessionalContribution.new
  end

  # GET /professional_contributions/1/edit
  def edit
  end

  # POST /professional_contributions
  # POST /professional_contributions.json
  def create
    @professional_contribution = ProfessionalContribution.new(professional_contribution_params)

    respond_to do |format|
      if @professional_contribution.save
        format.html { redirect_to @professional_contribution, notice: 'Professional contribution was successfully created.' }
        format.json { render action: 'show', status: :created, location: @professional_contribution }
      else
        format.html { render action: 'new' }
        format.json { render json: @professional_contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professional_contributions/1
  # PATCH/PUT /professional_contributions/1.json
  def update
    respond_to do |format|
      if @professional_contribution.update(professional_contribution_params)
        format.html { redirect_to @professional_contribution, notice: 'Professional contribution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @professional_contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_contributions/1
  # DELETE /professional_contributions/1.json
  def destroy
    @professional_contribution.destroy
    respond_to do |format|
      format.html { redirect_to professional_contributions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_contribution
      @professional_contribution = ProfessionalContribution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_contribution_params
      params.require(:professional_contribution).permit(:activity, :description, :url)
    end
end
