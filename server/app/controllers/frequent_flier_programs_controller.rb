class FrequentFlierProgramsController < ApplicationController
  before_action :set_frequent_flier_program, only: [:show, :edit, :update, :destroy]

  # GET /frequent_flier_programs
  # GET /frequent_flier_programs.json
  def index
    @frequent_flier_programs = FrequentFlierProgram.all
  end

  # GET /frequent_flier_programs/1
  # GET /frequent_flier_programs/1.json
  def show
  end

  # GET /frequent_flier_programs/new
  def new
    @frequent_flier_program = FrequentFlierProgram.new
  end

  # GET /frequent_flier_programs/1/edit
  def edit
  end

  # POST /frequent_flier_programs
  # POST /frequent_flier_programs.json
  def create
    @frequent_flier_program = FrequentFlierProgram.new(frequent_flier_program_params)

    respond_to do |format|
      if @frequent_flier_program.save
        format.html { redirect_to @frequent_flier_program, notice: 'Frequent flier program was successfully created.' }
        format.json { render action: 'show', status: :created, location: @frequent_flier_program }
      else
        format.html { render action: 'new' }
        format.json { render json: @frequent_flier_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frequent_flier_programs/1
  # PATCH/PUT /frequent_flier_programs/1.json
  def update
    respond_to do |format|
      if @frequent_flier_program.update(frequent_flier_program_params)
        format.html { redirect_to @frequent_flier_program, notice: 'Frequent flier program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @frequent_flier_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frequent_flier_programs/1
  # DELETE /frequent_flier_programs/1.json
  def destroy
    @frequent_flier_program.destroy
    respond_to do |format|
      format.html { redirect_to frequent_flier_programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frequent_flier_program
      @frequent_flier_program = FrequentFlierProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frequent_flier_program_params
      params.require(:frequent_flier_program).permit(:name, :number)
    end
end
