class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.query.select(img: 1,'building.phases.project_name'.to_sym => 'project_name', project_number: 1)
    # rename _id to id to conform with people route
    @projects = @projects.map { |p| h = p.as_json; h["id"] = h.delete "_id" ; h}
    render json: @projects
  end

  # get any projects with matching project numbers
  def numbers
    @projects = Project.where( project_number: params[:project_number] )
      .query
      .select('building.phases.project_name'.to_sym => 'project_name',
              project_number: 1)
    render json: @projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new
    @project.project_number = project_params[:project_number]
    @project.building = Building.new
    @project.building.phases << Phase.new
    @project.building.phases.first.project_name = project_params[:project_name]
    @project.building.phases.first.staff_contact_login = project_params[:project_login]

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update_from_params project_params #@project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render partial: 'projects/project.json.jbuilder', locals: { project: @project } }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit!
    end
end
