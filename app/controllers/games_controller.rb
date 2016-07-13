class GamesController < ApplicationController
  def show
    @game = Game.where(token: params[:id]).first

    if @game.present?
      render json: @game
    else
      error!(1002, "Game is not found.", 404)
    end
  end

  def create
    @game = Game.create
    @player = @game.players.create


    # FIXME: Use ActionController::Serialization but not serializable_hash
    render json: @game.serializable_hash.merge({ player_token: @player.token })
  end
end
