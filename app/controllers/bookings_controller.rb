class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  def new
    @booking = Booking.new
    @alien = Alien.find(params[:alien_id])
  end

  def create
    @alien = Alien.find(params[:alien_id])
    @booking = Booking.new(booking_params)
    @booking.alien = @alien
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @booking.update(booking_params)
    redirect_to bookings index path?
  end

  def destroy
    @booking.destroy
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:appointment_start_date, :appointment_end_date, :date_posted, :alien_id)
  end
end
