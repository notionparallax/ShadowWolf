class PersonalAwardsController < ApplicationController
  before_action :set_personal_award, only: [:show, :edit, :update, :destroy]

  # GET /personal_awards
  # GET /personal_awards.json
  def index
    @personal_awards = PersonalAward.all
  end

  # GET /personal_awards/1
  # GET /personal_awards/1.json
  def show
  end

  # GET /personal_awards/new
  def new
    @personal_award = PersonalAward.new
  end

  # GET /personal_awards/1/edit
  def edit
  end

  # POST /personal_awards
  # POST /personal_awards.json
  def create
    @personal_award = PersonalAward.new(personal_award_params)

    respond_to do |format|
      if @personal_award.save
        format.html { redirect_to @personal_award, notice: 'Personal award was successfully created.' }
        format.json { render action: 'show', status: :created, location: @personal_award }
      else
        format.html { render action: 'new' }
        format.json { render json: @personal_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_awards/1
  # PATCH/PUT /personal_awards/1.json
  def update
    respond_to do |format|
      if @personal_award.update(personal_award_params)
        format.html { redirect_to @personal_award, notice: 'Personal award was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @personal_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_awards/1
  # DELETE /personal_awards/1.json
  def destroy
    @personal_award.destroy
    respond_to do |format|
      format.html { redirect_to personal_awards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_award
      @personal_award = PersonalAward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_award_params
      params.require(:personal_award).permit(:name, :awarding_body, :description, :url, :year_achieved)
    end
end
