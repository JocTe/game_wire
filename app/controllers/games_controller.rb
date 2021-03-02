class GamesController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to game_path(@game.curent_user) # redirect to ?
  end
end
