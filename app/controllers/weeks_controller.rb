class WeeksController < ApplicationController

  def current
    @monday=Date.today.beginning_of_week
    render :show
  end

  def show
    @monday=params[:monday]
    render :show
  end

end
