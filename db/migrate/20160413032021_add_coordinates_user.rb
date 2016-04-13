class AddCoordinatesUser < ActiveRecord::Migration
  def change
  	add_column :users, :latitude, :float
		add_column :users, :longitude, :float  
  	remove_column :profiles, :latitude, :float
		remove_column :profiles, :longitude, :float  
  end
end
