class AddPositionToNodes < ActiveRecord::Migration[5.0]
  def change
    add_column :nodes, :position, :integer
  end
end
