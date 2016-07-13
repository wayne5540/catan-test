class ResourceItem < ApplicationRecord
  belongs_to :player

  validates :resource_type, inclusion: { in: %w(wood brick metal stone) }
end

# == Schema Information
#
# Table name: resource_items
#
#  id            :integer          not null, primary key
#  player_id     :integer
#  resource_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_resource_items_on_player_id  (player_id)
#
