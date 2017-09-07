class User < ApplicationRecord
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :payments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :sessions

  before_save { self.email.downcase! }

  validates :name, presence: true, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+[a-zA-Z -]*[a-zA-Z]+\z/,
    message: "only letters are allowed" }
  #validates :nickname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  #email supplied by our wonderful partners google and github, we do not need to check formatting.

  def balance group:nil
    if group
      group = Group.find_by_name(group) if group.class == String
      self.payments.where(group: group).sum('amount_cents')
    else
      self.payments.sum('amount_cents')
    end
  end
end