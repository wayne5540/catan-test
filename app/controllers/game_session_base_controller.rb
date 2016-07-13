class GameSessionBaseController < ApplicationController
  before_action :find_game!
  before_action :find_player!

  private

  def find_game!
    @game = Game.where(token: params[:game_id]).first

    if @game.blank?
      error!(1001, "Game is not found.", 404)
    end
  end

  def find_player!
    @player = @game.players.where(token: params[:player_token]).first

    if @player.blank?
      error!(1003, "Player is not found.", 404)
    end
  end
end
