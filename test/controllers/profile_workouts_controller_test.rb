require 'test_helper'

class ProfileWorkoutsControllerTest < ActionController::TestCase
  setup do
    @profile_workout = profile_workouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_workouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_workout" do
    assert_difference('ProfileWorkout.count') do
      post :create, profile_workout: { rating: @profile_workout.rating }
    end

    assert_redirected_to profile_workout_path(assigns(:profile_workout))
  end

  test "should show profile_workout" do
    get :show, id: @profile_workout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_workout
    assert_response :success
  end

  test "should update profile_workout" do
    patch :update, id: @profile_workout, profile_workout: { rating: @profile_workout.rating }
    assert_redirected_to profile_workout_path(assigns(:profile_workout))
  end

  test "should destroy profile_workout" do
    assert_difference('ProfileWorkout.count', -1) do
      delete :destroy, id: @profile_workout
    end

    assert_redirected_to profile_workouts_path
  end
end
