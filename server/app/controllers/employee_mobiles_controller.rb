class EmployeeMobilesController < ApplicationController
  before_action :set_employee_mobile, only: [:show, :edit, :update, :destroy]

  # GET /employee_mobiles
  # GET /employee_mobiles.json
  def index
    @employee_mobiles = EmployeeMobile.all
  end

  # GET /employee_mobiles/1
  # GET /employee_mobiles/1.json
  def show
  end

  # GET /employee_mobiles/new
  def new
    @employee_mobile = EmployeeMobile.new
  end

  # GET /employee_mobiles/1/edit
  def edit
  end

  # POST /employee_mobiles
  # POST /employee_mobiles.json
  def create
    @employee_mobile = EmployeeMobile.new(employee_mobile_params)

    respond_to do |format|
      if @employee_mobile.save
        format.html { redirect_to @employee_mobile, notice: 'Employee mobile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employee_mobile }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee_mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_mobiles/1
  # PATCH/PUT /employee_mobiles/1.json
  def update
    respond_to do |format|
      if @employee_mobile.update(employee_mobile_params)
        format.html { redirect_to @employee_mobile, notice: 'Employee mobile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee_mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_mobiles/1
  # DELETE /employee_mobiles/1.json
  def destroy
    @employee_mobile.destroy
    respond_to do |format|
      format.html { redirect_to employee_mobiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_mobile
      @employee_mobile = EmployeeMobile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_mobile_params
      params.require(:employee_mobile).permit(:number, :is_work, :distribute)
    end
end
