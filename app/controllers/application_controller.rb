class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  before_action :set_coords

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

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

