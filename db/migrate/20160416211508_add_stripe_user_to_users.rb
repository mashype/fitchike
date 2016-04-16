class AddStripeUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer, :text
  end
end
