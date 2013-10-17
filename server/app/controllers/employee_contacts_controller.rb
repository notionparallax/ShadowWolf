class EmployeeContactsController < ApplicationController
  before_action :set_employee_contact, only: [:show, :edit, :update, :destroy]

  # GET /employee_contacts
  # GET /employee_contacts.json
  def index
    @employee_contacts = EmployeeContact.all
  end

  # GET /employee_contacts/1
  # GET /employee_contacts/1.json
  def show
  end

  # GET /employee_contacts/new
  def new
    @employee_contact = EmployeeContact.new
  end

  # GET /employee_contacts/1/edit
  def edit
  end

  # POST /employee_contacts
  # POST /employee_contacts.json
  def create
    @employee_contact = EmployeeContact.new(employee_contact_params)

    respond_to do |format|
      if @employee_contact.save
        format.html { redirect_to @employee_contact, notice: 'Employee contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employee_contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_contacts/1
  # PATCH/PUT /employee_contacts/1.json
  def update
    respond_to do |format|
      if @employee_contact.update(employee_contact_params)
        format.html { redirect_to @employee_contact, notice: 'Employee contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_contacts/1
  # DELETE /employee_contacts/1.json
  def destroy
    @employee_contact.destroy
    respond_to do |format|
      format.html { redirect_to employee_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_contact
      @employee_contact = EmployeeContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_contact_params
      params.require(:employee_contact).permit(:extension, :studio, :work_email)
    end
end
