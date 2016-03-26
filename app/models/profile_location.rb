class ProfileLocation < ActiveRecord::Base

	belongs_to :profile
	belongs_to :location
	belongs_to :location_type

	accepts_nested_attributes_for :location

end
