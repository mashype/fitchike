class CreateProfileWorkouts < ActiveRecord::Migration
  def change
    create_table :profile_workouts do |t|
      t.integer :rating
  		t.belongs_to :profile, index: true, foreign_key: true
			t.belongs_to :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
