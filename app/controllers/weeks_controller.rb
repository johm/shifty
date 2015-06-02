class WeeksController < ApplicationController

  def current
    @monday=Date.today.beginning_of_week
    @shifts=Shift.where(:monday => @monday)
    render :show
  end

  def show
    @monday=Date.parse(params[:monday])
    @shifts=Shift.where(:monday => @monday)
    render :show
  end

  def apply_shift_template
    @monday=Date.parse(params[:monday])

    @shift_template=ShiftTemplate.find(params[:shift_template_id])
    @shift_template.apply_to_monday(@monday)
    
    @shifts=Shift.where(:monday => @monday)

    flash[:success] = "Template '#{@shift_template.name}' applied!"
    redirect_to "/weeks/#{@monday}"


  end

end
