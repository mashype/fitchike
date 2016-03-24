class CreateProfileWorkoutTypes < ActiveRecord::Migration
  def change
    create_table :profile_workout_types do |t|
      t.integer :rating
      t.belongs_to :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
