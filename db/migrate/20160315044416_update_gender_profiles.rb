class UpdateGenderProfiles < ActiveRecord::Migration
  def change
  	rename_column :profiles, :gender, :gender_id
  end
end
