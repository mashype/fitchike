class SetDefaultValues < ActiveRecord::Migration
  def change
  	change_column :profiles, :trainer, :boolean, :default => false
  	change_column :profiles, :private, :boolean, :default => false  	
  end
end
