class RenameProfileWorkoutTypesBack < ActiveRecord::Migration
  def change
  	rename_table :profileworkouts, :profile_workout_types
  end
end
