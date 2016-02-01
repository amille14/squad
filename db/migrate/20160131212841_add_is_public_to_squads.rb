class AddIsPublicToSquads < ActiveRecord::Migration[5.0]
  def change
    add_column :squads, :is_private, :boolean, default: true, null: false
    add_column :rooms, :is_private, :boolean, default: true, null: false
    add_column :posts, :is_private, :boolean, default: false, null: false
  end
end
