class CreateLandNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :land_nodes do |t|
      t.references :land, index: true
      t.references :node, index: true

      t.timestamps
    end
  end
end
