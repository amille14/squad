class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :type
      t.string :title
      t.string :link
      t.string :content
      t.integer :score
      t.boolean :is_nsfw
      t.integer :user_id
      t.integer :room_id
      t.timestamp :edited_at

      t.timestamps
    end
  end
end
