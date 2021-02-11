class AlienController < ApplicationController
  def index
    @aliens = Alien.all
  end

  def new
    @alien = Alien.new
  end

  def create
    @alien = Alien.new(alien_params)
    @alien.save

    redirect_to alien_path(@alien)
  end

  def edit
    @alien = Alien.find(params[:id])
  end

  def update
    if @alien.update_attributes(alien_params)
      redirect_to alien_path(@alien)
    else
      render action: :edit
    end
  end

  def show
    @alien = Alien.find(params[:id])
    @bookings = Booking.where("alien_id = '#{@alien.id}'")
    #todo get average of ratings from booking if bookings exist
    @booking = Booking.new
    #where the form is for the booking
  end

  def destroy
    @alien = Alien.find(params[:id])
    @alien.destroy
  end

  private

  def alien_params
    params.require(:alien).permit(:name, :species, :planet)
  end
end
