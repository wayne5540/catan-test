class GamesController < ApplicationController
  def show
    @game = Game.where(token: params[:id]).first

    if @game.present?
      render json: @game
    else
      error!(1001, "Game is not found.", 404)
    end
  end

  def create
    @game = Game.create

    render json: @game
  end
end
