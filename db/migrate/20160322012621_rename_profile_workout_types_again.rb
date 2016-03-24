class RenameProfileWorkoutTypesAgain < ActiveRecord::Migration
  def change
  	rename_table :profileworkouttypes, :profileworkouts
  end
end
