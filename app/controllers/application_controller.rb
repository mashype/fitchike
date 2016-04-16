class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_coords

  def after_sign_up_path_for(resource)
  	new_profile_path
  end

  def lookup_ip_location
		Geocoder.search(request.remote_ip).first
	end

	def set_coords
		if session[:latitude].nil?
			coords = lookup_ip_location
			session[:latitude] = coords.latitude
			session[:longitude] = coords.longitude
		end
	end	
end

