class EventParticipationsController < ApplicationController
  before_action :set_event_participation, only: [:show, :edit, :update, :destroy]

  # GET /event_participations
  # GET /event_participations.json
  def index
    @event_participations = EventParticipation.all
  end

  # GET /event_participations/1
  # GET /event_participations/1.json
  def show
  end

  # GET /event_participations/new
  def new
    @event_participation = EventParticipation.new
  end

  # GET /event_participations/1/edit
  def edit
  end

  # POST /event_participations
  # POST /event_participations.json
  def create
    @event_participation = EventParticipation.new(event_participation_params)

    respond_to do |format|
      if @event_participation.save
        format.html { redirect_to @event_participation, notice: 'Event participation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_participation }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_participations/1
  # PATCH/PUT /event_participations/1.json
  def update
    respond_to do |format|
      if @event_participation.update(event_participation_params)
        format.html { redirect_to @event_participation, notice: 'Event participation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_participations/1
  # DELETE /event_participations/1.json
  def destroy
    @event_participation.destroy
    respond_to do |format|
      format.html { redirect_to event_participations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_participation
      @event_participation = EventParticipation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_participation_params
      params.require(:event_participation).permit(:name, :date, :url)
    end
end
