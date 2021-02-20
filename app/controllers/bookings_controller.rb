class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy, :rating]
  before_action :authenticate_user!
  def new
    @booking = Booking.new
    @alien = Alien.find(params[:alien_id])
  end

  def index
    @bookings = Booking.all
  end

  def create
    @alien = Alien.find(params[:alien_id])

    #check for bookings
    existingBookings = Booking.where("alien_id = ?", params[:alien_id])

    canBook = true

    startDate = params[:booking][:appointment_start_date]
    endDate = params[:booking][:appointment_end_date]

    for booking in existingBookings do
      if startDate.between?(booking.appointment_start_date, booking.appointment_end_date) ||
        endDate.between?(booking.appointment_start_date, booking.appointment_end_date) ||
        (startDate < booking.appointment_start_date && endDate > booking.appointment_end_date)
        canBook = false
        break
      end
    end


    if canBook
      @booking = Booking.new(booking_params)
      @booking.alien = @alien
      @booking.user = current_user
      if @booking.save
        redirect_to booking_path(@booking)
      else
        redirect_to new_alien_booking_path(@alien)
      end
    else
      redirect_to new_alien_booking_path(@alien), notice: 'Alien is already booked'
    end
  end

  def show; end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else 
      render action: :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def rating
    if current_user == @booking.user
      @booking.rating = :rating
      @booking.save
      redirect_to booking_path(@booking)
    end
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:appointment_start_date, :appointment_end_date, :alien_id)
  end
end
