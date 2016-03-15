class AddGenderRefToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :gender, index: true, foreign_key: true
  end
end
