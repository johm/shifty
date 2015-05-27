require 'test_helper'

class PayRatesControllerTest < ActionController::TestCase
  setup do
    @pay_rate = pay_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_rate" do
    assert_difference('PayRate.count') do
      post :create, pay_rate: { effective: @pay_rate.effective, hourly_capital_contribution_in_cents: @pay_rate.hourly_capital_contribution_in_cents, hourly_pay_in_cents: @pay_rate.hourly_pay_in_cents, hourly_predicted_extra_wage_in_cents: @pay_rate.hourly_predicted_extra_wage_in_cents, notes: @pay_rate.notes, worker_id: @pay_rate.worker_id }
    end

    assert_redirected_to pay_rate_path(assigns(:pay_rate))
  end

  test "should show pay_rate" do
    get :show, id: @pay_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay_rate
    assert_response :success
  end

  test "should update pay_rate" do
    patch :update, id: @pay_rate, pay_rate: { effective: @pay_rate.effective, hourly_capital_contribution_in_cents: @pay_rate.hourly_capital_contribution_in_cents, hourly_pay_in_cents: @pay_rate.hourly_pay_in_cents, hourly_predicted_extra_wage_in_cents: @pay_rate.hourly_predicted_extra_wage_in_cents, notes: @pay_rate.notes, worker_id: @pay_rate.worker_id }
    assert_redirected_to pay_rate_path(assigns(:pay_rate))
  end

  test "should destroy pay_rate" do
    assert_difference('PayRate.count', -1) do
      delete :destroy, id: @pay_rate
    end

    assert_redirected_to pay_rates_path
  end
end
