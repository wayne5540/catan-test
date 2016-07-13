class AddLevelToNodes < ActiveRecord::Migration[5.0]
  def change
    add_column :nodes, :level, :integer, default: 0
  end
end
