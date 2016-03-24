class ProfileWorkout < ActiveRecord::Base

	belongs_to :profile
	belongs_to :workout

	accepts_nested_attributes_for :workout


end
