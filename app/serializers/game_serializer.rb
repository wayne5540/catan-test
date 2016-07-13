class GameSerializer < ActiveModel::Serializer
  attributes :token, :status

  has_many :players
end
