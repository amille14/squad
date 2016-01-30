class CreatePostUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :post_users do |t|
      t.timestamp :read_at
      t.integer :score, null: false, default: 0
      t.integer :post_id
      t.integer :user_id
      t.boolean :is_muted, default: false

      t.timestamps
    end

    add_index :post_users, :post_id
    add_index :post_users, [:user_id, :post_id]
  end
end
