class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :team_name
      t.string :role
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
