class User < ApplicationRecord
  has_secure_password
  has_many :cwallets
  has_many :cryptos, through: :cwallets
  has_many :transactions
  validates :email,
      uniqueness: true,
      format: {with: /@\w{2,}\./,
        message: "wrong format"}
  enum currency: [:usd, :myr]

  def cryptocurrency(crypto_id)
    transactions.where(crypto_id: crypto_id)
  end

end
