class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :type
      t.string :title
      t.string :link
      t.text :content
      t.integer :score, null: false, default: 0
      t.boolean :is_nsfw
      t.integer :user_id
      t.integer :room_id
      t.timestamp :edited_at

      t.timestamps
    end

    add_index :posts, :room_id
    add_index :posts, :user_id
  end
end
