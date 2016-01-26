class CreateSquadUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :squad_users do |t|
      t.integer :squad_id
      t.integer :user_id
      t.string :title
      t.integer :cred
      t.integer :permissions

      t.timestamps
    end
  end
end
