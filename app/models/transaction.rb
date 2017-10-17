class Transaction < ApplicationRecord
  belongs_to  :user
  belongs_to  :crypto
  enum todo: [:buy, :sell]
  before_save :update_total
  validates :amount, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :date, presence: true

  private

  def update_total
    self.total = amount * price
  end

end
