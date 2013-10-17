class SecurityClearancesController < ApplicationController
  before_action :set_security_clearance, only: [:show, :edit, :update, :destroy]

  # GET /security_clearances
  # GET /security_clearances.json
  def index
    @security_clearances = SecurityClearance.all
  end

  # GET /security_clearances/1
  # GET /security_clearances/1.json
  def show
  end

  # GET /security_clearances/new
  def new
    @security_clearance = SecurityClearance.new
  end

  # GET /security_clearances/1/edit
  def edit
  end

  # POST /security_clearances
  # POST /security_clearances.json
  def create
    @security_clearance = SecurityClearance.new(security_clearance_params)

    respond_to do |format|
      if @security_clearance.save
        format.html { redirect_to @security_clearance, notice: 'Security clearance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @security_clearance }
      else
        format.html { render action: 'new' }
        format.json { render json: @security_clearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /security_clearances/1
  # PATCH/PUT /security_clearances/1.json
  def update
    respond_to do |format|
      if @security_clearance.update(security_clearance_params)
        format.html { redirect_to @security_clearance, notice: 'Security clearance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @security_clearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_clearances/1
  # DELETE /security_clearances/1.json
  def destroy
    @security_clearance.destroy
    respond_to do |format|
      format.html { redirect_to security_clearances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_clearance
      @security_clearance = SecurityClearance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_clearance_params
      params.require(:security_clearance).permit(:issuing_body, :level, :expiry)
    end
end
