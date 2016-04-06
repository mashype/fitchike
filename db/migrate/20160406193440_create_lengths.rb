class CreateLengths < ActiveRecord::Migration
  def change
    create_table :lengths do |t|
      t.string :appointment_length

      t.timestamps null: false
    end
  end
end
