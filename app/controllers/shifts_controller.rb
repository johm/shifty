class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: [:show, :edit, :update, :destroy,:colorfix]
  load_and_authorize_resource
  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end
  
  def report 
    @from_date=params[:from_date]
    @to_date=params[:to_date]
    @shifts=Shift.where(:shift_template_id => nil ).where("monday >= ? and monday < ?",@from_date,@to_date)
  end

  def colorfix 
    respond_to do |format|
      format.js {}
    end
  end

  # GET /shifts/new
  def new
    @shift = Shift.new(shift_params)
    puts "TASK WAS #{@shift.task_id}"
    respond_to do |format|
      format.html.erb
      format.js {}
    end
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(shift_params)
    if @shift.end_time.nil?  
      @shift.end_time=@shift.start_time+4.hours
    end

    unless Tod::Shift.new(Tod::TimeOfDay.parse("6am"),Tod::TimeOfDay.parse("midnight")).contains?(@shift.shiftrange)
      @shift.end_time = Tod::TimeOfDay.parse("midnight")
    end



    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    original_duration=@shift.shiftrange.duration
    respond_to do |format|
      if @shift.update(shift_params)
        if shift_params.keys.include? "start_time"
          if shift_params.keys.include? "end_time" #we are updating based on drag, and we want to go to the end of the range
            @shift.end_time=@shift.end_time+30.minutes
            @shift.save
          else #we are updating based on drag, change end_time to reflect original duration
            @shift.end_time=@shift.start_time+original_duration
            @shift.save
          end
        end
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:worker_id, :day_of_week, :monday, :start_time, :end_time, :task_id, :notes,:description,:shift_template_id)
    end
end
