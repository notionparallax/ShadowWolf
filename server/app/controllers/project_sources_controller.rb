class ProjectSourcesController < ApplicationController
  before_action :set_project_source, only: [:show, :edit, :update, :destroy]

  # GET /project_sources
  # GET /project_sources.json
  def index
    @project_sources = ProjectSource.all
  end

  # GET /project_sources/1
  # GET /project_sources/1.json
  def show
  end

  # GET /project_sources/new
  def new
    @project_source = ProjectSource.new
  end

  # GET /project_sources/1/edit
  def edit
  end

  # POST /project_sources
  # POST /project_sources.json
  def create
    @project_source = ProjectSource.new(project_source_params)

    respond_to do |format|
      if @project_source.save
        format.html { redirect_to @project_source, notice: 'Project source was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_source }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_sources/1
  # PATCH/PUT /project_sources/1.json
  def update
    respond_to do |format|
      if @project_source.update(project_source_params)
        format.html { redirect_to @project_source, notice: 'Project source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_sources/1
  # DELETE /project_sources/1.json
  def destroy
    @project_source.destroy
    respond_to do |format|
      format.html { redirect_to project_sources_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_source
      @project_source = ProjectSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_source_params
      params.require(:project_source).permit(:competition_win, :competition_URL)
    end
end
