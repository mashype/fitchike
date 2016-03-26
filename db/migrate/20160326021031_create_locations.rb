class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
