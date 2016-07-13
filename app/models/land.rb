class Land < ApplicationRecord
  belongs_to :game
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
