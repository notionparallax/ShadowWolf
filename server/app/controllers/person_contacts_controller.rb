class PersonContactsController < ApplicationController
  before_action :set_person_contact, only: [:show, :edit, :update, :destroy]

  # GET /person_contacts
  # GET /person_contacts.json
  def index
    @person_contacts = PersonContact.all
  end

  # GET /person_contacts/1
  # GET /person_contacts/1.json
  def show
  end

  # GET /person_contacts/new
  def new
    @person_contact = PersonContact.new
  end

  # GET /person_contacts/1/edit
  def edit
  end

  # POST /person_contacts
  # POST /person_contacts.json
  def create
    @person_contact = PersonContact.new(person_contact_params)

    respond_to do |format|
      if @person_contact.save
        format.html { redirect_to @person_contact, notice: 'Person contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @person_contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @person_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_contacts/1
  # PATCH/PUT /person_contacts/1.json
  def update
    respond_to do |format|
      if @person_contact.update(person_contact_params)
        format.html { redirect_to @person_contact, notice: 'Person contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_contacts/1
  # DELETE /person_contacts/1.json
  def destroy
    @person_contact.destroy
    respond_to do |format|
      format.html { redirect_to person_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_contact
      @person_contact = PersonContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_contact_params
      params.require(:person_contact).permit(:personal_email, :personal_phone)
    end
end
