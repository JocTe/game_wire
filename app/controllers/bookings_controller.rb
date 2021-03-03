class BookingsController < ApplicationController

  before_action :set_user, only: [:new, :create]
  before_action :set_game, only: [:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create    
    @booking = Booking.new(booking_params) 
    @booking.user = @user
    @booking.game = @game
    authorize @booking
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to profile_path
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(state: "Accepté")
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(state: "Refusé")
    raise
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :state) # I'm not sure about the inclusion of state here
  end

  def set_user 
    @user = current_user
  end
  def set_game
    @game = Game.find(params[:game_id])
  end
end
