require 'test_helper'

class ProfileCertificationsControllerTest < ActionController::TestCase
  setup do
    @profile_certification = profile_certifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_certifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_certification" do
    assert_difference('ProfileCertification.count') do
      post :create, profile_certification: {  }
    end

    assert_redirected_to profile_certification_path(assigns(:profile_certification))
  end

  test "should show profile_certification" do
    get :show, id: @profile_certification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_certification
    assert_response :success
  end

  test "should update profile_certification" do
    patch :update, id: @profile_certification, profile_certification: {  }
    assert_redirected_to profile_certification_path(assigns(:profile_certification))
  end

  test "should destroy profile_certification" do
    assert_difference('ProfileCertification.count', -1) do
      delete :destroy, id: @profile_certification
    end

    assert_redirected_to profile_certifications_path
  end
end
