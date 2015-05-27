class WeeksController < ApplicationController

  def current
    @monday=Date.today.beginning_of_week
    @shifts=Shift.where(:monday => @monday)
    render :show
  end

  def show
    @monday=params[:monday]
    @shifts=Shift.where(:monday => @monday)
    render :show
  end

end
