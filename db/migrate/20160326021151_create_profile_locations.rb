class CreateProfileLocations < ActiveRecord::Migration
  def change
    create_table :profile_locations do |t|
      t.string :loc_title
   		t.belongs_to :profile, index: true, foreign_key: true
			t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
