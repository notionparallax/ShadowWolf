class ProjectExperiencesController < ApplicationController
  before_action :set_project_experience, only: [:show, :edit, :update, :destroy]

  # GET /project_experiences
  # GET /project_experiences.json
  def index
    @project_experiences = ProjectExperience.all
  end

  # GET /project_experiences/1
  # GET /project_experiences/1.json
  def show
  end

  # GET /project_experiences/new
  def new
    @project_experience = ProjectExperience.new
  end

  # GET /project_experiences/1/edit
  def edit
  end

  # POST /project_experiences
  # POST /project_experiences.json
  def create
    @project_experience = ProjectExperience.new(project_experience_params)

    respond_to do |format|
      if @project_experience.save
        format.html { redirect_to @project_experience, notice: 'Project experience was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_experience }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_experiences/1
  # PATCH/PUT /project_experiences/1.json
  def update
    respond_to do |format|
      if @project_experience.update(project_experience_params)
        format.html { redirect_to @project_experience, notice: 'Project experience was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_experiences/1
  # DELETE /project_experiences/1.json
  def destroy
    @project_experience.destroy
    respond_to do |format|
      format.html { redirect_to project_experiences_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_experience
      @project_experience = ProjectExperience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_experience_params
      params.require(:project_experience).permit(:start_date, :end_date, :name, :firm, :role, :stage, :url)
    end
end
