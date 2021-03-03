require 'open-uri'

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
    if !@game.photo.attached?
      default_image(@game)
    end
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game), notice: 'Le jeu a bien été édité'
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to profile_path # redirect to ?
  end

  private

  def game_params    
    params.require(:game).permit(:name, :description, :photo, :description, :number_of_players, :duration, :price)
  end

  def default_image(game)
    file = URI.open('https://images.unsplash.com/photo-1578377375762-cbcc98d68af0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
    game.photo.attach(io: file, filename: 'default.jpg', content_type: 'image/jpg')
  end
  
end
