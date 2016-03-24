class RenameWorkoutTypeName < ActiveRecord::Migration
  def change
  	rename_column :workouts, :workout_type_id, :workouttype_id
  end
end
