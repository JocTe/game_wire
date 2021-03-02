class GamesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]
  
  def index
    @games = Game.all
  end
  
  def show    
    @game = Game.find(params[:id])

  end
  
  def new
    @game = Game.new
  end
  
  def create    
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
    
  end

  private

  def game_params
    params.require(:game).permit(:name, :description)
    # params.require(:game).permit(:name, :description, photos: [])
  end

end
