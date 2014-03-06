class DimensionGroupsController < ApplicationController
  before_action :set_dimension_group, only: [:show, :edit, :update, :destroy]

  # GET /dimension_groups
  # GET /dimension_groups.json
  def index
    @dimension_groups = DimensionGroup.all
  end

  # GET /dimension_groups/1
  # GET /dimension_groups/1.json
  def show
  end

  # GET /dimension_groups/new
  def new
    @dimension_group = DimensionGroup.new
  end

  # GET /dimension_groups/1/edit
  def edit
  end

  # POST /dimension_groups
  # POST /dimension_groups.json
  def create
    @dimension_group = DimensionGroup.new(dimension_group_params)

    respond_to do |format|
      if @dimension_group.save
        format.html { redirect_to @dimension_group, notice: 'Dimension group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dimension_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @dimension_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dimension_groups/1
  # PATCH/PUT /dimension_groups/1.json
  def update
    respond_to do |format|
      if @dimension_group.update(dimension_group_params)
        format.html { redirect_to @dimension_group, notice: 'Dimension group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dimension_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dimension_groups/1
  # DELETE /dimension_groups/1.json
  def destroy
    @dimension_group.destroy
    respond_to do |format|
      format.html { redirect_to dimension_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dimension_group
      @dimension_group = DimensionGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dimension_group_params
      params[:dimension_group]
    end
end
