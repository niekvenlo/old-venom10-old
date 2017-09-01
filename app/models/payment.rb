class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  validates :amount_cents, presence: true, numericality: { greater_than: 0, less_than: 10000 }
  validates :description, presence: true, length: { minimum: 3 }
  
  def amount
    self.amount_cents/100.0
  end
  
  def amount=(base)
    self.amount_cents = base*100
  end
end
