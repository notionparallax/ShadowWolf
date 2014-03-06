class ReferredBiesController < ApplicationController
  before_action :set_referred_by, only: [:show, :edit, :update, :destroy]

  # GET /referred_bies
  # GET /referred_bies.json
  def index
    @referred_bies = ReferredBy.all
  end

  # GET /referred_bies/1
  # GET /referred_bies/1.json
  def show
  end

  # GET /referred_bies/new
  def new
    @referred_by = ReferredBy.new
  end

  # GET /referred_bies/1/edit
  def edit
  end

  # POST /referred_bies
  # POST /referred_bies.json
  def create
    @referred_by = ReferredBy.new(referred_by_params)

    respond_to do |format|
      if @referred_by.save
        format.html { redirect_to @referred_by, notice: 'Referred by was successfully created.' }
        format.json { render action: 'show', status: :created, location: @referred_by }
      else
        format.html { render action: 'new' }
        format.json { render json: @referred_by.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referred_bies/1
  # PATCH/PUT /referred_bies/1.json
  def update
    respond_to do |format|
      if @referred_by.update(referred_by_params)
        format.html { redirect_to @referred_by, notice: 'Referred by was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @referred_by.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referred_bies/1
  # DELETE /referred_bies/1.json
  def destroy
    @referred_by.destroy
    respond_to do |format|
      format.html { redirect_to referred_bies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referred_by
      @referred_by = ReferredBy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referred_by_params
      params.require(:referred_by).permit(:BVN_staff_login, :contact_name, :contact_organisation)
    end
end
