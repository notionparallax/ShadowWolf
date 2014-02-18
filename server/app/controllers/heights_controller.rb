class HeightsController < ApplicationController
  before_action :set_height, only: [:show, :edit, :update, :destroy]

  # GET /heights
  # GET /heights.json
  def index
    @heights = Height.all
  end

  # GET /heights/1
  # GET /heights/1.json
  def show
  end

  # GET /heights/new
  def new
    @height = Height.new
  end

  # GET /heights/1/edit
  def edit
  end

  # POST /heights
  # POST /heights.json
  def create
    @height = Height.new(height_params)

    respond_to do |format|
      if @height.save
        format.html { redirect_to @height, notice: 'Height was successfully created.' }
        format.json { render action: 'show', status: :created, location: @height }
      else
        format.html { render action: 'new' }
        format.json { render json: @height.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heights/1
  # PATCH/PUT /heights/1.json
  def update
    respond_to do |format|
      if @height.update(height_params)
        format.html { redirect_to @height, notice: 'Height was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @height.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heights/1
  # DELETE /heights/1.json
  def destroy
    @height.destroy
    respond_to do |format|
      format.html { redirect_to heights_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_height
      @height = Height.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def height_params
      params.require(:height).permit(:measurement, :standard_name, :standard_version)
    end
end
