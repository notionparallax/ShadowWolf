class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authorize_person, except: [:index, :show, :logins]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  def logins
    @people = Person.where( 'employee.login' => params[:login] )
      .query
      .select 'employee.login' => 1,
        'name.preferred_first' => 1,
        'name.preferred_last'  => 1
    render json: @people
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update_from_params(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render partial: 'people/person.json.jbuilder', locals: { person: @person } }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person =  Person.where( 'employee.login'.to_sym => params[:id] ).first || Person.find(params[:id])
      name = "#{@person.employee.login}, #{@person.name.first} #{@person.name.last}"
      logger.info "Set person: #{name}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params[:person].permit!
    end

    def authorize_person
      apiKey = ApiKey.where( access_token: params[:access_token] ).first
      if request.method == 'GET'
        render status: :forbidden unless @person.admin? or apiKey #and apiKey.person == @person
      elsif request.method == 'POST'
        render status: :forbidden unless apiKey and apiKey.person == @person
      end
      logger.info "Authorized: #{apiKey.person.employee.login}, #{apiKey.person.name.first} #{apiKey.person.name.last}" if apiKey
    end
end
