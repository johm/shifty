class PayRatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pay_rate, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /pay_rates
  # GET /pay_rates.json
  def index
    @pay_rates = PayRate.all
  end

  # GET /pay_rates/1
  # GET /pay_rates/1.json
  def show
  end

  # GET /pay_rates/new
  def new
    @pay_rate = PayRate.new
  end

  # GET /pay_rates/1/edit
  def edit
  end

  # POST /pay_rates
  # POST /pay_rates.json
  def create
    @pay_rate = PayRate.new(pay_rate_params)

    respond_to do |format|
      if @pay_rate.save
        format.html { redirect_to @pay_rate, notice: 'Pay rate was successfully created.' }
        format.json { render :show, status: :created, location: @pay_rate }
      else
        format.html { render :new }
        format.json { render json: @pay_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_rates/1
  # PATCH/PUT /pay_rates/1.json
  def update
    respond_to do |format|
      if @pay_rate.update(pay_rate_params)
        format.html { redirect_to @pay_rate, notice: 'Pay rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay_rate }
      else
        format.html { render :edit }
        format.json { render json: @pay_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_rates/1
  # DELETE /pay_rates/1.json
  def destroy
    @pay_rate.destroy
    respond_to do |format|
      format.html { redirect_to pay_rates_url, notice: 'Pay rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_rate
      @pay_rate = PayRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_rate_params
      params.require(:pay_rate).permit(:worker_id, :effective, :hourly_pay_in_cents, :hourly_capital_contribution_in_cents, :hourly_predicted_extra_wage_in_cents, :notes)
    end
end
