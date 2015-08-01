class MilestoneAccomplishmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_milestone_accomplishment, only: [:show,:edit, :update, :destroy]

  def index
    @milestone_accomplishments=MilestoneAccomplishment.all
  end
  
  def show
  end

  # GET /milestone_accomplishments/new
  def new
    @milestone_accomplishment = MilestoneAccomplishment.new
    @milestone_accomplishment.worker=Worker.find(params[:milestone_accomplishment][:worker_id])
  end

  # GET /milestone_accomplishments/1/edit
  def edit
  end

  # POST /milestone_accomplishments
  # POST /milestone_accomplishments.json
  def create
    @milestone_accomplishment = MilestoneAccomplishment.new(milestone_accomplishment_params)

    respond_to do |format|
      if @milestone_accomplishment.save
        format.html { redirect_to @milestone_accomplishment.worker, notice: 'MilestoneAccomplishment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /milestone_accomplishments/1
  # PATCH/PUT /milestone_accomplishments/1.json
  def update
    respond_to do |format|
      if @milestone_accomplishment.update(milestone_accomplishment_params)
        format.html { redirect_to @milestone_accomplishment.worker, notice: 'MilestoneAccomplishment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /milestone_accomplishments/1
  # DELETE /milestone_accomplishments/1.json
  def destroy
    @milestone_accomplishment.destroy
    respond_to do |format|
      format.html { redirect_to milestone_accomplishments_url, notice: 'MilestoneAccomplishment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone_accomplishment
      @milestone_accomplishment = MilestoneAccomplishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milestone_accomplishment_params
      params.require(:milestone_accomplishment).permit(:date,:worker_id,:milestone_id,:notes)
    end
end
