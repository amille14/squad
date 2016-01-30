class CreateSquadUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :squad_users do |t|
      t.integer :squad_id
      t.integer :user_id
      t.string :title
      t.integer :cred, null: false, default: 0
      t.integer :permissions, null: false, default: 1

      t.timestamps
    end

    add_index :squad_users, :squad_id
    add_index :squad_users, [:user_id, :squad_id]
    add_index :squad_users, [:squad_id, :permissions]
  end
end
