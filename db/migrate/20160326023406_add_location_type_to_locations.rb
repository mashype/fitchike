class AddLocationTypeToLocations < ActiveRecord::Migration
  def change
  	add_column :locations, :location_type_id, :integer
		add_column :locations, :guests, :boolean  	
  end
end
