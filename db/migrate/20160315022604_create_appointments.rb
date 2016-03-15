class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :title
      t.text :comments

      t.timestamps null: false
    end
  end
end
