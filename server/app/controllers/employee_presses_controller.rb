class EmployeePressesController < ApplicationController
  before_action :set_employee_press, only: [:show, :edit, :update, :destroy]

  # GET /employee_presses
  # GET /employee_presses.json
  def index
    @employee_presses = EmployeePress.all
  end

  # GET /employee_presses/1
  # GET /employee_presses/1.json
  def show
  end

  # GET /employee_presses/new
  def new
    @employee_press = EmployeePress.new
  end

  # GET /employee_presses/1/edit
  def edit
  end

  # POST /employee_presses
  # POST /employee_presses.json
  def create
    @employee_press = EmployeePress.new(employee_press_params)

    respond_to do |format|
      if @employee_press.save
        format.html { redirect_to @employee_press, notice: 'Employee press was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employee_press }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee_press.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_presses/1
  # PATCH/PUT /employee_presses/1.json
  def update
    respond_to do |format|
      if @employee_press.update(employee_press_params)
        format.html { redirect_to @employee_press, notice: 'Employee press was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee_press.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_presses/1
  # DELETE /employee_presses/1.json
  def destroy
    @employee_press.destroy
    respond_to do |format|
      format.html { redirect_to employee_presses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_press
      @employee_press = EmployeePress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_press_params
      params[:employee_press]
    end
end
