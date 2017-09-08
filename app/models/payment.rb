class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :amount_cents, presence: true#, numericality: { greater_than: 0, less_than: 10000 }
  validates :description, presence: true, length: { minimum: 3 }

  def amount
    # amount_cents is nil for new Payments
    (amount_cents || 0) / 100.0
  end

  def amount=(full_amount_string)
    # Receiving a string from params, converting to Float
    full_amount = full_amount_string.to_f
    self.amount_cents = full_amount*100
  end
end
