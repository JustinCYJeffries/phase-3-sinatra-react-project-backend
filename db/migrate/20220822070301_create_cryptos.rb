class CreateCryptos < ActiveRecord::Migration[6.1]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.string :ticker
      t.decimal :price
      t.decimal :volume
    end
  end
end
