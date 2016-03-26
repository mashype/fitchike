require 'test_helper'

class ProfileLocationsControllerTest < ActionController::TestCase
  setup do
    @profile_location = profile_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_location" do
    assert_difference('ProfileLocation.count') do
      post :create, profile_location: { loc_title: @profile_location.loc_title }
    end

    assert_redirected_to profile_location_path(assigns(:profile_location))
  end

  test "should show profile_location" do
    get :show, id: @profile_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_location
    assert_response :success
  end

  test "should update profile_location" do
    patch :update, id: @profile_location, profile_location: { loc_title: @profile_location.loc_title }
    assert_redirected_to profile_location_path(assigns(:profile_location))
  end

  test "should destroy profile_location" do
    assert_difference('ProfileLocation.count', -1) do
      delete :destroy, id: @profile_location
    end

    assert_redirected_to profile_locations_path
  end
end
