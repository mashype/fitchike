class Workout < ActiveRecord::Base

	has_many :profile_workouts
	has_many :profiles, through: :profile_workouts

end
