class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resource)
  	new_profile_path
  end

  def lookup_ip_location
	  if Rails.env.development?
	    Geocoder.search(request.remote_ip).first
	  else
	    request.location
	  end
	end
end

