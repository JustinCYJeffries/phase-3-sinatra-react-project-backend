class AddIdToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :crypto_id, :integer
    add_column :purchases, :portfolio_id, :integer
  end
end
