require 'open-uri'

class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_game, only: [ :show, :edit, :update, :destroy ]
  def index
    @games = Game.all
    @games = policy_scope(Game)
  end
  
  def show    
    @booking = Booking.new
  end

  def new
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    authorize @game    
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game), notice: 'Le jeu a bien été édité'
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to profile_path # redirect to ?
  end

  private

  def set_game
    @game = Game.find(params[:id])
    authorize @game
  end

  def game_params    
    params.require(:game).permit(:name, :description, :photo, :description, :number_of_players, :duration, :price)
  end
  
end
