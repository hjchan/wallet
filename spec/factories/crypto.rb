FactoryGirl.define do
  factory :crypto do
    name "Bitcoin"
    cryptos_api "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCMYR"
  end

  factory :crypto1, class: Crypto do
    name "Ethereum"
    cryptos_api "https://apiv2.bitcoinaverage.com/indices/global/ticker/ETHMYR"
  end
end
