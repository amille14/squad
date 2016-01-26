class CreatePostUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :post_users do |t|
      t.timestamp :seen_at
      t.integer :score
      t.integer :post_id
      t.integer :user_id
      t.boolean :is_muted

      t.timestamps
    end
  end
end
