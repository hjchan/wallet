class DeleteCurrencyFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :currency
  end
end
