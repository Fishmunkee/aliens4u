class BookingsController < ApplicationController
  def new
    @alien = Alien.find(params[:alien_id])
    @booking = Booking.new
  end

  def create
    @alien = Alien.find(params[:alien_id])
    @booking = Booking.new(booking_params)
  end

  private
  def booking_params
    params.require(:booking).permit(:appointment_start_date, :appointment_end_date, :date_posted)
  end
end
