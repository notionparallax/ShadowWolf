class AttentionsController < ApplicationController
  before_action :set_attention, only: [:show, :edit, :update, :destroy]

  # GET /attentions
  # GET /attentions.json
  def index
    @attentions = Attention.all
  end

  # GET /attentions/1
  # GET /attentions/1.json
  def show
  end

  # GET /attentions/new
  def new
    @attention = Attention.new
  end

  # GET /attentions/1/edit
  def edit
  end

  # POST /attentions
  # POST /attentions.json
  def create
    @attention = Attention.new(attention_params)

    respond_to do |format|
      if @attention.save
        format.html { redirect_to @attention, notice: 'Attention was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attention }
      else
        format.html { render action: 'new' }
        format.json { render json: @attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attentions/1
  # PATCH/PUT /attentions/1.json
  def update
    respond_to do |format|
      if @attention.update(attention_params)
        format.html { redirect_to @attention, notice: 'Attention was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attentions/1
  # DELETE /attentions/1.json
  def destroy
    @attention.destroy
    respond_to do |format|
      format.html { redirect_to attentions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attention
      @attention = Attention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attention_params
      params.require(:attention).permit(:date, :url, :scan_or_screengrab, :body_text, :publication, :reason)
    end
end
