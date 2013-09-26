class PersonNamesController < ApplicationController
  before_action :set_person_name, only: [:show, :edit, :update, :destroy]

  # GET /person_names
  # GET /person_names.json
  def index
    @person_names = PersonName.all
  end

  # GET /person_names/1
  # GET /person_names/1.json
  def show
  end

  # GET /person_names/new
  def new
    @person_name = PersonName.new
  end

  # GET /person_names/1/edit
  def edit
  end

  # POST /person_names
  # POST /person_names.json
  def create
    @person_name = PersonName.new(person_name_params)

    respond_to do |format|
      if @person_name.save
        format.html { redirect_to @person_name, notice: 'Person name was successfully created.' }
        format.json { render action: 'show', status: :created, location: @person_name }
      else
        format.html { render action: 'new' }
        format.json { render json: @person_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_names/1
  # PATCH/PUT /person_names/1.json
  def update
    respond_to do |format|
      if @person_name.update(person_name_params)
        format.html { redirect_to @person_name, notice: 'Person name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_names/1
  # DELETE /person_names/1.json
  def destroy
    @person_name.destroy
    respond_to do |format|
      format.html { redirect_to person_names_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_name
      @person_name = PersonName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_name_params
      params.require(:person_name).permit(:first, :last, :preferred_first, :preferred_last)
    end
end
