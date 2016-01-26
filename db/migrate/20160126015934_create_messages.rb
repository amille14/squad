class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :room_id
      t.timestamp :edited_at
      t.string :content

      t.timestamps
    end
  end
end
