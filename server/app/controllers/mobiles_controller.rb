class MobilesController < ApplicationController
  before_action :set_mobile, only: [:show, :edit, :update, :destroy]

  # GET /mobiles
  # GET /mobiles.json
  def index
    @mobiles = Mobile.all
  end

  # GET /mobiles/1
  # GET /mobiles/1.json
  def show
  end

  # GET /mobiles/new
  def new
    @mobile = Mobile.new
  end

  # GET /mobiles/1/edit
  def edit
  end

  # POST /mobiles
  # POST /mobiles.json
  def create
    @mobile = Mobile.new(mobile_params)

    respond_to do |format|
      if @mobile.save
        format.html { redirect_to @mobile, notice: 'Mobile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mobile }
      else
        format.html { render action: 'new' }
        format.json { render json: @mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobiles/1
  # PATCH/PUT /mobiles/1.json
  def update
    respond_to do |format|
      if @mobile.update(mobile_params)
        format.html { redirect_to @mobile, notice: 'Mobile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobiles/1
  # DELETE /mobiles/1.json
  def destroy
    @mobile.destroy
    respond_to do |format|
      format.html { redirect_to mobiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobile
      @mobile = Mobile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mobile_params
      params[:mobile]
    end
end
