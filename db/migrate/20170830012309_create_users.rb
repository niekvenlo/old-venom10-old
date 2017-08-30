class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.text :about_me
      t.string :email
      t.boolean :allow_email_invite
      t.string :github_id
      t.string :google_id
      t.string :avatar_url

      t.timestamps
    end
  end
end
