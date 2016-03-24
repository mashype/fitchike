class DropWorkoutTables < ActiveRecord::Migration
  def change
  	drop_table :workouts
  	drop_table :workouttypes
  end
end
