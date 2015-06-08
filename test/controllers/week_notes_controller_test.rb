require 'test_helper'

class WeekNotesControllerTest < ActionController::TestCase
  setup do
    @week_note = week_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:week_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create week_note" do
    assert_difference('WeekNote.count') do
      post :create, week_note: { author: @week_note.author, monday: @week_note.monday, note: @week_note.note }
    end

    assert_redirected_to week_note_path(assigns(:week_note))
  end

  test "should show week_note" do
    get :show, id: @week_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @week_note
    assert_response :success
  end

  test "should update week_note" do
    patch :update, id: @week_note, week_note: { author: @week_note.author, monday: @week_note.monday, note: @week_note.note }
    assert_redirected_to week_note_path(assigns(:week_note))
  end

  test "should destroy week_note" do
    assert_difference('WeekNote.count', -1) do
      delete :destroy, id: @week_note
    end

    assert_redirected_to week_notes_path
  end
end
