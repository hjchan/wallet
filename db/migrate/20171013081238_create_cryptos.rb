class CreateCryptos < ActiveRecord::Migration[5.1]
  def change
    create_table :cryptos do |t|
      t.string  :name
      t.timestamps
    end
  end
end
