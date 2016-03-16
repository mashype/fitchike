class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.integer :user_id
      t.string :appointment_id
      t.string :confirmation_temp

      t.timestamps null: false
    end
  end
end
