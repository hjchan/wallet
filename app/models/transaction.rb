class Transaction < ApplicationRecord
  belongs_to  :user
  belongs_to  :crypto
  enum todo: [:buy, :sell]
  before_save :update_total

  private

  def update_total
    self.total = amount * price
  end

end
