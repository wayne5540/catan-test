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
  #    ______
  #   /\    /\
  #  / 0\ 1/ 2\
  # /____\/____\
  # \    /\    /
  #  \ 5/ 4\ 3/
  #   \/____\/
  def generate_lands!

    resources = %w(wood brick metal stone)
    random_resource = resources.concat(resources.sample(2)).sample(6)
    random_dice_points = %w(1 2 3 4 5 6).sample(6)

    %w(0 1 2 3 4 5).shuffle.each.with_index do |position, index|
      game.lands.create(
        resource_type: random_resource[index],
        position: position,
        dice_point: random_dice_points[index]
      )
    end
  end

  # NODE:
  #    0____1
  #   /\    /\
  #  /  \  /  \
  # 5____\6____\
  # \    /\    /2
  #  \  /  \  /
  #   4/____\/3

  def generate_nodes!
    7.times do |index|
      game.nodes.create(
        position: index,
        land_ids: land_ids_for_node(index)
      )
    end
  end

  def land_ids_for_node(index)
    land_positions = case index
    when 0..4
      [index,index+1]
    when 5
      [0,5]
    when 6
      [0,1,2,3,4,5]
    end

    game.lands.where(position: land_positions).pluck(:id)
  end

end