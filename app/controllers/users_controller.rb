class UsersController < ApplicationController
  

  def index
    @bookings = current_user.bookings
  end

  def games
    @games = current_user.games
  end

  def show
    @user = current_user
  end
end
