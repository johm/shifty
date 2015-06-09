class ShiftTemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift_template, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /shift_templates
  # GET /shift_templates.json
  def index
    @shift_templates = ShiftTemplate.all
  end

  # GET /shift_templates/1
  # GET /shift_templates/1.json
  def show
    @shifts=@shift_template.shifts
    render "weeks/show"
  end

  # GET /shift_templates/new
  def new
    @shift_template = ShiftTemplate.new
  end

  # GET /shift_templates/1/edit
  def edit
  end

  # POST /shift_templates
  # POST /shift_templates.json
  def create
    @shift_template = ShiftTemplate.new(shift_template_params)

    respond_to do |format|
      if @shift_template.save
        format.html { redirect_to @shift_template, notice: 'Shift template was successfully created.' }
        format.json { render :show, status: :created, location: @shift_template }
      else
        format.html { render :new }
        format.json { render json: @shift_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shift_templates/1
  # PATCH/PUT /shift_templates/1.json
  def update
    respond_to do |format|
      if @shift_template.update(shift_template_params)
        format.html { redirect_to @shift_template, notice: 'Shift template was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift_template }
      else
        format.html { render :edit }
        format.json { render json: @shift_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shift_templates/1
  # DELETE /shift_templates/1.json
  def destroy
    @shift_template.destroy
    respond_to do |format|
      format.html { redirect_to shift_templates_url, notice: 'Shift template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_template
      @shift_template = ShiftTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_template_params
      params.require(:shift_template).permit(:name, :notes)
    end
end
