class DropOldLengthFromAppointemnts < ActiveRecord::Migration
  def change
 		remove_column :appointments, :length
  end
end
