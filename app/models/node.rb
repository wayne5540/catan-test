class Node < ApplicationRecord
  belongs_to :game
  belongs_to :player, optional: true

  has_many :land_nodes
  has_many :lands, through: :land_nodes

  validates :level, numericality: { less_than_or_equal_to: 3 }
  validates :position, presence: true

  # TODO: Refactor
  def place_token!(player)
    check_player_resource!
    if self.player.blank?
      increment(:level)
      self.player = player
      self.save
    else
      if self.player == player
        increment(:level)
        self.save
      else
        self.errors.add(:player, :invalid, "player not match")
        false
      end
    end
  end

  private

  def check_player_resource!
    # TODO: Implement this, if resource_items.count not enough, add errors to node
    true
  end

end

# == Schema Information
#
# Table name: nodes
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#  level      :integer          default(0)
#  player_id  :integer
#
# Indexes
#
#  index_nodes_on_game_id    (game_id)
#  index_nodes_on_player_id  (player_id)
#
