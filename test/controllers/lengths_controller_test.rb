require 'test_helper'

class LengthsControllerTest < ActionController::TestCase
  setup do
    @length = lengths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lengths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create length" do
    assert_difference('Length.count') do
      post :create, length: { appointment_length: @length.appointment_length }
    end

    assert_redirected_to length_path(assigns(:length))
  end

  test "should show length" do
    get :show, id: @length
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @length
    assert_response :success
  end

  test "should update length" do
    patch :update, id: @length, length: { appointment_length: @length.appointment_length }
    assert_redirected_to length_path(assigns(:length))
  end

  test "should destroy length" do
    assert_difference('Length.count', -1) do
      delete :destroy, id: @length
    end

    assert_redirected_to lengths_path
  end
end
