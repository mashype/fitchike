class DropGenderProfiles < ActiveRecord::Migration
  def change
  	remove_column :profiles, :gender_id
  end
end
