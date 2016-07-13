class Land < ApplicationRecord
  belongs_to :game

  has_many :land_nodes
  has_many :nodes, through: :land_nodes
end

# == Schema Information
#
# Table name: lands
#
#  id            :integer          not null, primary key
#  game_id       :integer
#  resource_type :string
#  position      :integer
#  dice_point    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_lands_on_game_id  (game_id)
#
