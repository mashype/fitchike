class AddIndexToLocations < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE EXTENSION if not exists cube;
      CREATE EXTENSION if not exists earthdistance;
      CREATE INDEX geo_location on locations USING GIST(ll_to_earth(latitude, longitude));
    SQL
  end
end
