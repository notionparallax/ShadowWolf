class OfficeCulturesController < ApplicationController
  before_action :set_office_culture, only: [:show, :edit, :update, :destroy]

  # GET /office_cultures
  # GET /office_cultures.json
  def index
    @office_cultures = OfficeCulture.all
  end

  # GET /office_cultures/1
  # GET /office_cultures/1.json
  def show
  end

  # GET /office_cultures/new
  def new
    @office_culture = OfficeCulture.new
  end

  # GET /office_cultures/1/edit
  def edit
  end

  # POST /office_cultures
  # POST /office_cultures.json
  def create
    @office_culture = OfficeCulture.new(office_culture_params)

    respond_to do |format|
      if @office_culture.save
        format.html { redirect_to @office_culture, notice: 'Office culture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @office_culture }
      else
        format.html { render action: 'new' }
        format.json { render json: @office_culture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_cultures/1
  # PATCH/PUT /office_cultures/1.json
  def update
    respond_to do |format|
      if @office_culture.update(office_culture_params)
        format.html { redirect_to @office_culture, notice: 'Office culture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @office_culture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_cultures/1
  # DELETE /office_cultures/1.json
  def destroy
    @office_culture.destroy
    respond_to do |format|
      format.html { redirect_to office_cultures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_culture
      @office_culture = OfficeCulture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_culture_params
      params.require(:office_culture).permit(:first_aider, :fire_warden)
    end
end
