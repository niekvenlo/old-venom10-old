class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  validates :amount_cents, presence: true, numericality: { greater_than: 0, less_than: 10000 }
  validates :description, presence: true, length: { minimum: 3 }
  
end
