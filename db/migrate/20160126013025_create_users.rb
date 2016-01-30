class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :username, unique: true, null: false
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
