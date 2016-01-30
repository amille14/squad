class CreateSquads < ActiveRecord::Migration[5.0]
  def change
    create_table :squads do |t|
      t.string :name, unique: true

      t.timestamps
    end

    add_index :squads, :name, unique: true
  end
end
