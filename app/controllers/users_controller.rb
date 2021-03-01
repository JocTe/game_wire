class UsersController < ApplicationController
  
  def games
    @games = current_user.games
  end
end
