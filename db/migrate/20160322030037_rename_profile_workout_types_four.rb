class RenameProfileWorkoutTypesFour < ActiveRecord::Migration
  def change
  	rename_table :profile_workout_types, :workouts
  end
end
