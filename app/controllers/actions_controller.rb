class ActionsController < GameSessionBaseController

  # FIXME: Refactor
  def roll_dice
    dice_point = [1,2,3,4,5,6].sample

    lands = @game.lands.where(dice_point: dice_point).includes(nodes: :player)

    player_score = {}

    @game.players.each do |player|
      player_score[player.token] = {
        wood: 0,
        brick: 0,
        metal: 0,
        stone: 0
      }
    end

    lands.each do |land|
      land.nodes.each do |node|
        next if node.player.blank?

        node.player.add_resource!(land.resource_type, node.level)

        player_score[node.player.token][land.resource_type.to_sym] += node.level
      end
    end

    render json: {
      dice_point: dice_point,
      player_score: player_score
    }
  end
end
