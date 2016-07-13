class Node < ApplicationRecord
  belongs_to :game
  belongs_to :player, optional: true

  has_many :land_nodes
  has_many :lands, through: :land_nodes

  validates :level, numericality: { less_than_or_equal_to: 3 }
  validates :position, presence: true

  def place_token!(player)
    if self.player == player
      increment(level)
      self.save
    else
      self.errors.add(:player, :invalid, "player not match")
    end
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
#
# Indexes
#
#  index_nodes_on_game_id  (game_id)
#
