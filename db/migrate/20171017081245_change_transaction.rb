class ChangeTransaction < ActiveRecord::Migration[5.1]
  def change
    change_column :transactions, :amount, :decimal
    change_column :transactions, :price, :decimal
    change_column :transactions, :total, :decimal
  end
end
