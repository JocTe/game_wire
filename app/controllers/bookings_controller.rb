class BookingsController < ApplicationController

  before_action :set_user, only: [:new, :create]
  before_action :set_game, only: [:new, :create]
  before_action :set_booking, only: [:destroy, :accept, :decline]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create    
    @booking = Booking.new(booking_params) 
    @booking.user = @user
    @booking.game = @game
    @booking.state = "En attente..."
    
    authorize @booking
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to profile_path
  end

  def accept
    @booking.update(state: "Accepté")
    redirect_to profile_path
  end

  def decline
    @booking.update(state: "Refusé")
    redirect_to profile_path
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

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
