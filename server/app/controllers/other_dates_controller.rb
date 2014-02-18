class OtherDatesController < ApplicationController
  before_action :set_other_date, only: [:show, :edit, :update, :destroy]

  # GET /other_dates
  # GET /other_dates.json
  def index
    @other_dates = OtherDate.all
  end

  # GET /other_dates/1
  # GET /other_dates/1.json
  def show
  end

  # GET /other_dates/new
  def new
    @other_date = OtherDate.new
  end

  # GET /other_dates/1/edit
  def edit
  end

  # POST /other_dates
  # POST /other_dates.json
  def create
    @other_date = OtherDate.new(other_date_params)

    respond_to do |format|
      if @other_date.save
        format.html { redirect_to @other_date, notice: 'Other date was successfully created.' }
        format.json { render action: 'show', status: :created, location: @other_date }
      else
        format.html { render action: 'new' }
        format.json { render json: @other_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_dates/1
  # PATCH/PUT /other_dates/1.json
  def update
    respond_to do |format|
      if @other_date.update(other_date_params)
        format.html { redirect_to @other_date, notice: 'Other date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @other_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_dates/1
  # DELETE /other_dates/1.json
  def destroy
    @other_date.destroy
    respond_to do |format|
      format.html { redirect_to other_dates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_date
      @other_date = OtherDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def other_date_params
      params.require(:other_date).permit(:date, :description)
    end
end
