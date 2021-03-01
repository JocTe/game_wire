class BookingsController < ApplicationController

  before_action :set_user, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @game = Game.find(params[:game_id])
    @booking = Booking.new(booking_params) 
    @booking.user = @user
    @booking.game = @game
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :state) # I'm not sure about the inclusion of state here
  end

  def set_user 
    @user = current_user
  end
end
