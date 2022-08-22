class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.boolean :sold
      t.decimal :amount_purchaced
      t.decimal :purchase_price
      t.decimal :profit
      t.timestamps
    end
  end
end
