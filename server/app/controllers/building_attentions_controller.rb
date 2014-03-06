class BuildingAttentionsController < ApplicationController
  before_action :set_building_attention, only: [:show, :edit, :update, :destroy]

  # GET /building_attentions
  # GET /building_attentions.json
  def index
    @building_attentions = BuildingAttention.all
  end

  # GET /building_attentions/1
  # GET /building_attentions/1.json
  def show
  end

  # GET /building_attentions/new
  def new
    @building_attention = BuildingAttention.new
  end

  # GET /building_attentions/1/edit
  def edit
  end

  # POST /building_attentions
  # POST /building_attentions.json
  def create
    @building_attention = BuildingAttention.new(building_attention_params)

    respond_to do |format|
      if @building_attention.save
        format.html { redirect_to @building_attention, notice: 'Building attention was successfully created.' }
        format.json { render action: 'show', status: :created, location: @building_attention }
      else
        format.html { render action: 'new' }
        format.json { render json: @building_attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /building_attentions/1
  # PATCH/PUT /building_attentions/1.json
  def update
    respond_to do |format|
      if @building_attention.update(building_attention_params)
        format.html { redirect_to @building_attention, notice: 'Building attention was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @building_attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /building_attentions/1
  # DELETE /building_attentions/1.json
  def destroy
    @building_attention.destroy
    respond_to do |format|
      format.html { redirect_to building_attentions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_attention
      @building_attention = BuildingAttention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_attention_params
      params.require(:building_attention).permit(:date, :url, :scan_or_screengrab, :body_text, :publication, :reason)
    end
end
