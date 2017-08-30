class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :amount_cents
      t.text :description
      t.timestamp :removed_at

      t.timestamps
    end
  end
end
