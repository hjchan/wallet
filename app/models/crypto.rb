class Crypto < ApplicationRecord
  has_many :cwallets
  has_many :users, through: :cwallets
  has_many :transactions
end
