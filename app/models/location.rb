class Location < ActiveRecord::Base

	geocoded_by :address

	def address
	  [address_1, city, state, zip].compact.join(', ')
	end

	after_validation :geocode, :if => :address_1_changed?

	has_many :profile_locations
	has_many :profiles, through: :profile_locations

	has_many :appointments

end
