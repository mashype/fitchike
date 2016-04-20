class UpdateAppointmentDefault < ActiveRecord::Migration
  def change
  	change_column_default(:appointments, :active, 'true')
  end
end
