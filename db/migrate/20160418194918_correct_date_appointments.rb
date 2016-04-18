class CorrectDateAppointments < ActiveRecord::Migration
  def change
  	remove_column :appointments, :date
  	add_column :appointments, :end_date, :date
  end
end
