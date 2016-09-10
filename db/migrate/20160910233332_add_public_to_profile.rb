class AddPublicToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :private, :boolean
  end
end
