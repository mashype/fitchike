class AddLengthToAppointment < ActiveRecord::Migration
  def change
  	add_column :appointments, :length_id, :integer
  end
end
