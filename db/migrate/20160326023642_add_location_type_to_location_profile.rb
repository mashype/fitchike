class AddLocationTypeToLocationProfile < ActiveRecord::Migration
  def change
   	add_column :profile_locations, :location_type_id, :integer
		add_column :profile_locations, :guests, :boolean  
		remove_column :locations, :location_type_id
		remove_column :locations, :guests
  end
end
