class AlienController < ApplicationController
  def index
    @aliens = Alien.all
  end

  def search
    @aliens = Alien.where("name LIKE ?", "%#{params[:q]}%")
  end

  def new
    @alien = Alien.new
  end

  def create
    @alien = Alien.new(alien_params)
    @alien.user = current_user

    if @alien.save
      redirect_to @alien, notice: 'Alien was successfully created.'
    else
      render :new
    end
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
<<<<<<< HEAD
    @bookings = Booking.where("alien_id = ?", "'#{@alien.id}'")
    if @bookings.length > 0
      average = bookings.sum(&:rating) / bookings.length
      @alien.rating = average
    end
=======
    @bookings = Booking.where("alien_id = '#{@alien.id}'")
    #todo get average of ratings from booking if bookings exist
    @booking = Booking.new
    #where the form is for the booking
>>>>>>> origin/master
  end

  def destroy
    @alien.destroy
    redirect_to aliens_path, notice: 'Alien was destroyed.'
  end

  private

  def alien_params
    params.require(:alien).permit(:name, :species, :planet)
  end
end
