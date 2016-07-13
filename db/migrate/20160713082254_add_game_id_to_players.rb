class AddGameIdToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :game, index: true
  end
end
