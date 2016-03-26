class Location < ActiveRecord::Base

	has_many :profile_locations
	has_many :locations, through: :profile_locations

end
