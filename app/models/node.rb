class Node < ApplicationRecord
  belongs_to :game
end

# == Schema Information
#
# Table name: nodes
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_nodes_on_game_id  (game_id)
#
