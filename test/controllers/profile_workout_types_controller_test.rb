require 'test_helper'

class ProfileWorkoutTypesControllerTest < ActionController::TestCase
  setup do
    @profile_workout_type = profile_workout_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_workout_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_workout_type" do
    assert_difference('ProfileWorkoutType.count') do
      post :create, profile_workout_type: { profiles_id: @profile_workout_type.profiles_id, rating: @profile_workout_type.rating }
    end

    assert_redirected_to profile_workout_type_path(assigns(:profile_workout_type))
  end

  test "should show profile_workout_type" do
    get :show, id: @profile_workout_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_workout_type
    assert_response :success
  end

  test "should update profile_workout_type" do
    patch :update, id: @profile_workout_type, profile_workout_type: { profiles_id: @profile_workout_type.profiles_id, rating: @profile_workout_type.rating }
    assert_redirected_to profile_workout_type_path(assigns(:profile_workout_type))
  end

  test "should destroy profile_workout_type" do
    assert_difference('ProfileWorkoutType.count', -1) do
      delete :destroy, id: @profile_workout_type
    end

    assert_redirected_to profile_workout_types_path
  end
end
