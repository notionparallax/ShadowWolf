class DietariesController < ApplicationController
  before_action :set_dietary, only: [:show, :edit, :update, :destroy]

  # GET /dietaries
  # GET /dietaries.json
  def index
    @dietaries = Dietary.all
  end

  # GET /dietaries/1
  # GET /dietaries/1.json
  def show
  end

  # GET /dietaries/new
  def new
    @dietary = Dietary.new
  end

  # GET /dietaries/1/edit
  def edit
  end

  # POST /dietaries
  # POST /dietaries.json
  def create
    @dietary = Dietary.new(dietary_params)

    respond_to do |format|
      if @dietary.save
        format.html { redirect_to @dietary, notice: 'Dietary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dietary }
      else
        format.html { render action: 'new' }
        format.json { render json: @dietary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dietaries/1
  # PATCH/PUT /dietaries/1.json
  def update
    respond_to do |format|
      if @dietary.update(dietary_params)
        format.html { redirect_to @dietary, notice: 'Dietary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dietary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dietaries/1
  # DELETE /dietaries/1.json
  def destroy
    @dietary.destroy
    respond_to do |format|
      format.html { redirect_to dietaries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dietary
      @dietary = Dietary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dietary_params
      params.require(:dietary).permit(:requirements)
    end
end
