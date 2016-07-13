class GameSessionBaseController < ApplicationController
  before_action :find_game!

  private

  def find_game!
    @game = Game.where(token: params[:game_id]).first

    if @game.blank?
      error!(1001, "Game is not found.", 404)
    end
  end
end
