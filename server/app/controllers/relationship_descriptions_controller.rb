class RelationshipDescriptionsController < ApplicationController
  before_action :set_relationship_description, only: [:show, :edit, :update, :destroy]

  # GET /relationship_descriptions
  # GET /relationship_descriptions.json
  def index
    @relationship_descriptions = RelationshipDescription.all
  end

  # GET /relationship_descriptions/1
  # GET /relationship_descriptions/1.json
  def show
  end

  # GET /relationship_descriptions/new
  def new
    @relationship_description = RelationshipDescription.new
  end

  # GET /relationship_descriptions/1/edit
  def edit
  end

  # POST /relationship_descriptions
  # POST /relationship_descriptions.json
  def create
    @relationship_description = RelationshipDescription.new(relationship_description_params)

    respond_to do |format|
      if @relationship_description.save
        format.html { redirect_to @relationship_description, notice: 'Relationship description was successfully created.' }
        format.json { render action: 'show', status: :created, location: @relationship_description }
      else
        format.html { render action: 'new' }
        format.json { render json: @relationship_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relationship_descriptions/1
  # PATCH/PUT /relationship_descriptions/1.json
  def update
    respond_to do |format|
      if @relationship_description.update(relationship_description_params)
        format.html { redirect_to @relationship_description, notice: 'Relationship description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @relationship_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relationship_descriptions/1
  # DELETE /relationship_descriptions/1.json
  def destroy
    @relationship_description.destroy
    respond_to do |format|
      format.html { redirect_to relationship_descriptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship_description
      @relationship_description = RelationshipDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_description_params
      params.require(:relationship_description).permit(:client, :stakeholder, :councils)
    end
end
