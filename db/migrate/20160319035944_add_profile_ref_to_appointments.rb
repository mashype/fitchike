class AddProfileRefToAppointments < ActiveRecord::Migration
  def change
  	add_reference :appointments, :profile, index: true, foreign_key: true
  end
end
