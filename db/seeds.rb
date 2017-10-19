# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "abc@gmail.com", password: "123", password_confirmation: "123")
Crypto.create(name: "Bitcoin", cryptos_api: "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCMYR")
Crypto.create(name: "Ethereum", cryptos_api: "https://apiv2.bitcoinaverage.com/indices/global/ticker/ETHMYR")