class AddPlayerReferencesToNode < ActiveRecord::Migration[5.0]
  def change
    add_reference :nodes, :player, index: true
  end
end
