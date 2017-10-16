class CreateCwallets < ActiveRecord::Migration[5.1]
  def change
    create_table :cwallets do |t|
      t.belongs_to  :user, index: true
      t.belongs_to  :crypto, index: true
      t.timestamps
    end
  add_index :cwallets, [:user_id, :crypto_id], unique: true
  end
end
