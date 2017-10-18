class AddApiToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :cryptos_api, :string
  end
end
