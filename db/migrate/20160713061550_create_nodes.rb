class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.references :game, index: true

      t.timestamps
    end
  end
end
