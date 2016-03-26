class DropLocTitleFromProfileLocations < ActiveRecord::Migration
  def change
  	remove_column :profile_locations, :loc_title
  end
end
