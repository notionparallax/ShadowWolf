require 'net/http'
require "uri"
require 'json'

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
    refresh_hero_image if params[:refresh_hero_image]
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

    PROJECT_URL = '/REST/1/Projects'
    FILE_URL = '/REST/1/Files'
    OPEN_ASSET_URL = ENV['OPEN_ASSET_URL_PROD']
    OPEN_ASSET_USERNAME = ENV['OPEN_ASSET_USERNAME']
    OPEN_ASSET_PASSWORD = ENV['OPEN_ASSET_PASSWORD']
    def ask_oa(request, params)
      uri = URI.parse(OPEN_ASSET_URL + request)
      uri.query = URI.encode_www_form(params)
      request = Net::HTTP::Get.new(uri.request_uri)
      request.basic_auth(OPEN_ASSET_USERNAME, OPEN_ASSET_PASSWORD)
      response = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(request) }
      json_response = JSON.parse(response.body)
      return json_response
    end
    def selectHighestRankedImage projectImages
      projectImages.inject({rank: '0'}) do |bestYet,current|
        current['rank'].to_i > bestYet['rank'].to_i ? current : bestYet
      end
    end
    def selectImageFileSize imageFileSizes
      imageFileSizes.inject({'width' => '-100000000'}) do |bestYet,current|
        bestYetDistance = (200 - bestYet['width'].to_i).abs
        currentDistance = (200 - current['width'].to_i).abs
        currentDistance < bestYetDistance ? current : bestYet
      end
    end
    def refresh_hero_image
      projectOpenAssetID = ask_oa(PROJECT_URL, { textMatching: 'exact', code: @project.project_number })[0]['id']
      projectImages = ask_oa(FILE_URL, { textMatching: 'exact', project_id: projectOpenAssetID })
      highestRankedImage = selectHighestRankedImage projectImages
      highestRankedImageFileSizes = ask_oa(FILE_URL + "/#{highestRankedImage['id']}/Sizes", { file_format: 'jpg' })
      chosenHighestRankedImageSize = selectImageFileSize highestRankedImageFileSizes
      heroImageUrl = OPEN_ASSET_URL + chosenHighestRankedImageSize['http_root'] + chosenHighestRankedImageSize['relative_path']
      @project.img = heroImageUrl
      @project.save
    end

end
