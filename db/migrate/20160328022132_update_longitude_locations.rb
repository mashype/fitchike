class UpdateLongitudeLocations < ActiveRecord::Migration
  def change
  	rename_column :locations, :longitute, :longitude
  end
end
