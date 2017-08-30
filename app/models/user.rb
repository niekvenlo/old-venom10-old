class User < ApplicationRecord
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :payments#, dependent: :destroy
  has_many :messages#, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2 }
  # We need to ensure we provide a temporary nickname
  validates :nickname, presence: true
  # Can we catch a uniqueness validation failure to trigger account consolidation?
  validates :email, uniqueness: { case_sensitive: false }
end
