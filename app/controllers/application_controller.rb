class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags, if: "request.get?"

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

  def prepare_meta_tags(options={})
    site_name   = "Fitchike"
    title       = [controller_name, action_name].join(" ")
    description = "If you are looking to connect with a personal trainer or just finding a fitness buddy or a workout partner, find someone in your area that is looking to workout with you today"
    image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        "Fitchike",
      title:       "Personalized Fitness",
      description: "If you are looking to connect with a personal trainer or just finding a fitness buddy or a workout partner, find someone in your area that is looking to workout with you today",
      keywords:    "fitness workout healthy trainer gym yoga pilates social san diego personal training",
      twitter: {
        site_name: "fitchike",
        site: '@fitchike',
        card: 'summary',
        description: 'Fitchike Twitter page',
        image: image
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end

end

