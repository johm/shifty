require 'test_helper'

class ShiftTemplatesControllerTest < ActionController::TestCase
  setup do
    @shift_template = shift_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shift_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shift_template" do
    assert_difference('ShiftTemplate.count') do
      post :create, shift_template: { name: @shift_template.name, notes: @shift_template.notes }
    end

    assert_redirected_to shift_template_path(assigns(:shift_template))
  end

  test "should show shift_template" do
    get :show, id: @shift_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shift_template
    assert_response :success
  end

  test "should update shift_template" do
    patch :update, id: @shift_template, shift_template: { name: @shift_template.name, notes: @shift_template.notes }
    assert_redirected_to shift_template_path(assigns(:shift_template))
  end

  test "should destroy shift_template" do
    assert_difference('ShiftTemplate.count', -1) do
      delete :destroy, id: @shift_template
    end

    assert_redirected_to shift_templates_path
  end
end
