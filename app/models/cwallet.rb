class Cwallet < ApplicationRecord
  belongs_to :user
  belongs_to :crypto

  validates :user_id, uniqueness: { scope: :crypto_id } 
end
