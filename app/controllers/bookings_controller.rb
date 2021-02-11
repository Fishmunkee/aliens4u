class BookingsController < ApplicationController
  def new
    @alien = Alien.find(params[:alien_id])
  end

  def create
    @alien = Alien.find(params[:alien_id])
    @booking = Booking.new(booking_params)
    @booking.alien = @alien
    @booking.user = current_user
    if @booking.save
      redirect_to alien_path(@alien)
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:appointment_start_date, :appointment_end_date, :date_posted, :alien_id)
  end
end
