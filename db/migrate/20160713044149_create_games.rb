class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :token, null: false
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :games, :token, unique: true
  end
end
