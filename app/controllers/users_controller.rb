class UsersController < ApplicationController
  

  # def index
  #   @bookings = user.bookings
  # end

  # def games
  #   @games = current_user.games
  # end

  def show
    @user = current_user
    @games = policy_scope(Game)
    authorize @games
    
  end
end
