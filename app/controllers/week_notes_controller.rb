class WeekNotesController < ApplicationController
  before_action :set_week_note, only: [:show, :edit, :update, :destroy]

  # GET /week_notes
  # GET /week_notes.json
  def index
    @week_notes = WeekNote.all
  end

  # GET /week_notes/1
  # GET /week_notes/1.json
  def show
  end

  # GET /week_notes/new
  def new
    @week_note = WeekNote.new
  end

  # GET /week_notes/1/edit
  def edit
  end

  # POST /week_notes
  # POST /week_notes.json
  def create
    @week_note = WeekNote.new(week_note_params)

    respond_to do |format|
      if @week_note.save
        format.html { redirect_to @week_note, notice: 'Week note was successfully created.' }
        format.json { render :show, status: :created, location: @week_note }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @week_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /week_notes/1
  # PATCH/PUT /week_notes/1.json
  def update
    respond_to do |format|
      if @week_note.update(week_note_params)
        format.html { redirect_to @week_note, notice: 'Week note was successfully updated.' }
        format.json { render :show, status: :ok, location: @week_note }
      else
        format.html { render :edit }
        format.json { render json: @week_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /week_notes/1
  # DELETE /week_notes/1.json
  def destroy
    @week_note.destroy
    respond_to do |format|
      format.html { redirect_to week_notes_url, notice: 'Week note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week_note
      @week_note = WeekNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_note_params
      params.require(:week_note).permit(:note, :monday, :author)
    end
end
