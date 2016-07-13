class Player < ApplicationRecord
  has_secure_token

  belongs_to :game
  has_many :nodes
end

# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#
# Indexes
#
#  index_players_on_game_id  (game_id)
#
