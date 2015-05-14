require 'test_helper'

class ShiftsControllerTest < ActionController::TestCase
  setup do
    @shift = shifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shift" do
    assert_difference('Shift.count') do
      post :create, shift: { day_of_week: @shift.day_of_week, end_time: @shift.end_time, monday: @shift.monday, notes: @shift.notes, start_time: @shift.start_time, task_id: @shift.task_id, worker_id: @shift.worker_id }
    end

    assert_redirected_to shift_path(assigns(:shift))
  end

  test "should show shift" do
    get :show, id: @shift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shift
    assert_response :success
  end

  test "should update shift" do
    patch :update, id: @shift, shift: { day_of_week: @shift.day_of_week, end_time: @shift.end_time, monday: @shift.monday, notes: @shift.notes, start_time: @shift.start_time, task_id: @shift.task_id, worker_id: @shift.worker_id }
    assert_redirected_to shift_path(assigns(:shift))
  end

  test "should destroy shift" do
    assert_difference('Shift.count', -1) do
      delete :destroy, id: @shift
    end

    assert_redirected_to shifts_path
  end
end
