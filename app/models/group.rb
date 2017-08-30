class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :payments, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2 }
  validates :currency_type, presence: true
end
