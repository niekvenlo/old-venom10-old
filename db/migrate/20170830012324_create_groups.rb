class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :about_group
      t.string :token
      t.string :currency_type
      t.integer :admin_id

      t.timestamps
    end
  end
end
