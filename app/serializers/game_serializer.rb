class GameSerializer < ActiveModel::Serializer
  attributes :id, :token, :status
end
