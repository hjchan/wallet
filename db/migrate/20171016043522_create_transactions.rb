class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :crypto
      t.belongs_to :user
      t.integer :todo
      t.integer :amount
      t.integer :price
      t.integer :total
      t.date  :date
      t.timestamps
    end
  end
end
