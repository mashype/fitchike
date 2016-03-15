class AddProfileIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :profile_id, :integer
  end
end
