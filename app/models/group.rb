class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :payments, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :currency_type, presence: true
  validates :admin_id, presence: true

  def is_group_admin? user
    self.admin_id == user.id
  end

  def admin
    User.find self.admin_id
  end

  def admin=(user)
    self.admin_id = user.id
  end

end
