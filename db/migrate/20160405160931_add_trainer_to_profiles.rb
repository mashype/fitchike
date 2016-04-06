class AddTrainerToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :trainer, :boolean
  end
end
