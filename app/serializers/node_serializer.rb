class NodeSerializer < ActiveModel::Serializer
  attributes :id, :position, :level

  belongs_to :player
end
