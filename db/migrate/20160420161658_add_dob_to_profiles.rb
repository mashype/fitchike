class AddDobToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :dob, :date
    remove_column :profiles, :zip
  end
end
