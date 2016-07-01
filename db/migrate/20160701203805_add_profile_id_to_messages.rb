class AddProfileIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :profile_id, :integer
  end
end
