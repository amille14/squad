class CreateRoomUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :room_users do |t|
      t.integer :room_id
      t.integer :user_id
      t.timestamp :last_read_at
      t.integer :permissions

      t.timestamps
    end

    add_index :room_users, :room_id
    add_index :room_users, [:user_id, :room_id]
    add_index :room_users, [:room_id, :permissions]
  end
end
