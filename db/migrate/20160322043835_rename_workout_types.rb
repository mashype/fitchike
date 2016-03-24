class RenameWorkoutTypes < ActiveRecord::Migration
  def change
  	rename_table :workout_types, :workouttypes
  end
end
