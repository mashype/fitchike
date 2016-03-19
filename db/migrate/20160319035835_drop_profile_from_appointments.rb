class DropProfileFromAppointments < ActiveRecord::Migration
  def change
  	remove_column :appointments, :profile_id
  end
end
