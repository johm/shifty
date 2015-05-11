require 'test_helper'

class WorkgroupsControllerTest < ActionController::TestCase
  setup do
    @workgroup = workgroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workgroup" do
    assert_difference('Workgroup.count') do
      post :create, workgroup: { name: @workgroup.name }
    end

    assert_redirected_to workgroup_path(assigns(:workgroup))
  end

  test "should show workgroup" do
    get :show, id: @workgroup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workgroup
    assert_response :success
  end

  test "should update workgroup" do
    patch :update, id: @workgroup, workgroup: { name: @workgroup.name }
    assert_redirected_to workgroup_path(assigns(:workgroup))
  end

  test "should destroy workgroup" do
    assert_difference('Workgroup.count', -1) do
      delete :destroy, id: @workgroup
    end

    assert_redirected_to workgroups_path
  end
end
