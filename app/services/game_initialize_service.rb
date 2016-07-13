# 1. To make this example simple, we assume only 1 square map with 5 nodes


class GameInitializeService
  attr_accessor :game

  def initialize(game)
    self.game = game
  end

  def perform!
    generate_lands!
    generate_nodes!
  end


  private

  # LAND:
  # -------
  # |\ 0 /|
  # | \ / |
  # |3 x 1|
  # | / \ |
  # |/ 2 \|
  # -------

  # TODO: Randomly generate resources and dice_point
  def generate_lands!
    [:wood, :rock, :brick, :cotton].each.with_index do |resource, index|
      game.lands.create(
        resource_type: resource,
        position: index,
        dice_point: index
      )
    end
  end


  # NODE:
  # 0-----1
  # |\   /|
  # | \ / |
  # |  4  |
  # | / \ |
  # |/   \|
  # 3-----2

  def generate_nodes!
    5.times.with_index do |index|
      game.nodes.create(
        position: index
        land_ids: land_ids(index)
      )
    end
  end

  def land_ids_for_node(index)
    land_positions = case index
    when 0
      [0,3]
    when 1..4
      [index-1, index]
    when 5
      [0,1,2,3]
    end

    game.lands.where(position: [0,3]).pluck(:id)
  end

end