class RenameProfileWorkoutTypes < ActiveRecord::Migration
  def change
    rename_table :profile_workout_types, :profileworkouttypes
  end
end
