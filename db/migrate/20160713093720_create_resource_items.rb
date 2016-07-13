class CreateResourceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :resource_items do |t|
      t.references :player, index: true
      t.string :resource_type

      t.timestamps
    end
  end
end
