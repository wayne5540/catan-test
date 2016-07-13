class LandNode < ApplicationRecord
  belongs_to :land
  belongs_to :node
end

# == Schema Information
#
# Table name: land_nodes
#
#  id         :integer          not null, primary key
#  land_id    :integer
#  node_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_land_nodes_on_land_id  (land_id)
#  index_land_nodes_on_node_id  (node_id)
#
