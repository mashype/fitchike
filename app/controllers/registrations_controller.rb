class RegistrationsController < Devise::RegistrationsController
  protected


  def after_sign_up_path_for(resource)
    new_profile_path
  end

  private
	  def sign_up_params
	    params.require(:user).permit(:username, :email, :latitude, :longitude, :password, :password_confirmation)
	  end

	  def account_update_params
	    params.require(:user).permit(:username, :email, :latitude, :longitude, :password, :password_confirmation, :current_password)
	  end
end
