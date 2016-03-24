class AddIndexToProfileWorkoutTypes < ActiveRecord::Migration
  def change
  	add_reference :profile_workout_types, :workout_type, index: true, foreign_key: true
  end
end
