class User < ApplicationRecord
  has_secure_password
  has_many :cwallets
  has_many :cryptos, through: :cwallets
  has_many :transactions
  validates :email,
      presence: true,
      uniqueness: true,
      format: {with: /@\w{2,}\./,
        message: "wrong format"}
  validates :password, presence: true

  def cryptocurrency(crypto_id)
    transactions.where(crypto_id: crypto_id)
  end

  def total_amount(crypto_id, date)
    total_buy(crypto_id, :amount, date) - total_sell(crypto_id, :amount, date)
  end

  def total_cost(crypto_id, date)
    total_buy(crypto_id, :total, date) - total_sell(crypto_id, :total, date)
  end

  def total_buy(crypto_id, column, date)
    cryptocurrency(crypto_id).where(date: date, todo: "buy").pluck(column).sum
  end

  def total_sell(crypto_id, column, date)
    cryptocurrency(crypto_id).where(date: date, todo: "sell").pluck(column).sum
  end

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.password = SecureRandom.hex(10)
      user.email = auth.info.email
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end

end
