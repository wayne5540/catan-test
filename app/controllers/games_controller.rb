class GamesController < ApplicationController
  def show
    @game = Game.where(token: params[:game_id]).first

    if @game.present?
      render json: @game
    else
      error!(1001, "Game is not found.", 404)
    end
  end

  def create
    @game = Game.create
    @player = @game.players.create

    render json: @game
  end
end
