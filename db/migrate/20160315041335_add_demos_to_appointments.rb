class AddDemosToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :price, :integer
    add_column :appointments, :length, :integer
    add_column :appointments, :date, :string
    add_column :appointments, :active, :boolean
  end
end
