class AddEmailToConfirmations < ActiveRecord::Migration
  def change
    add_column :confirmations, :email, :string
  end
end
