class UpdateGeocodeFieldsLocations < ActiveRecord::Migration
  def change
  	rename_column :locations, :lat, :latitude
  	rename_column :locations, :lon, :longitute
  end
end
