class NodeSerializer < ActiveModel::Serializer
  attributes :position, :level

  belongs_to :player
end
