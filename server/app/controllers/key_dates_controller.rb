class KeyDatesController < ApplicationController
  before_action :set_key_date, only: [:show, :edit, :update, :destroy]

  # GET /key_dates
  # GET /key_dates.json
  def index
    @key_dates = KeyDate.all
  end

  # GET /key_dates/1
  # GET /key_dates/1.json
  def show
  end

  # GET /key_dates/new
  def new
    @key_date = KeyDate.new
  end

  # GET /key_dates/1/edit
  def edit
  end

  # POST /key_dates
  # POST /key_dates.json
  def create
    @key_date = KeyDate.new(key_date_params)

    respond_to do |format|
      if @key_date.save
        format.html { redirect_to @key_date, notice: 'Key date was successfully created.' }
        format.json { render action: 'show', status: :created, location: @key_date }
      else
        format.html { render action: 'new' }
        format.json { render json: @key_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_dates/1
  # PATCH/PUT /key_dates/1.json
  def update
    respond_to do |format|
      if @key_date.update(key_date_params)
        format.html { redirect_to @key_date, notice: 'Key date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @key_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_dates/1
  # DELETE /key_dates/1.json
  def destroy
    @key_date.destroy
    respond_to do |format|
      format.html { redirect_to key_dates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_date
      @key_date = KeyDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_date_params
      params.require(:key_date).permit(:date, :name, :description)
    end
end
