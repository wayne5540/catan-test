class CreateLands < ActiveRecord::Migration[5.0]
  def change
    create_table :lands do |t|
      t.references :game, index: true
      t.string :resource_type
      t.integer :position
      t.integer :dice_point

      t.timestamps
    end
  end
end
