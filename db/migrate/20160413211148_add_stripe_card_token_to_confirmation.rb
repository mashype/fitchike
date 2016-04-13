class AddStripeCardTokenToConfirmation < ActiveRecord::Migration
  def change
    add_column :confirmations, :card_token, :string
  end
end
