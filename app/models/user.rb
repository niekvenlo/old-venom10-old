class User < ApplicationRecord
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :payments, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2 }
  validates :nickname, presence: true
  # We should downcase email addresses before saving them
  validates :email, uniqueness: { case_sensitive: false }
  
  def balance group:nil
    if group
      group = Group.find_by_name(group) if group.class == String
      self.payments.where(group: group).sum('amount_cents')
    else
      self.payments.sum('amount_cents')
    end
  end
  
end
