class AliensController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @aliens = Alien.all
    @aliens.each do |alien|
      @bookings = Booking.where("alien_id = ?", "#{alien.id}")
      if !@bookings.nil? && @bookings.size > 0
        average = @bookings.sum(&:rating) / @bookings.length
        alien.rating = average
      end
      alien.rating = 2
    end
  end

  def search
    @aliens = Alien.where("name ILIKE ?", "%#{params[:q]}%")
    @aliens.each do |alien|
      @bookings = Booking.where("alien_id = ?", "#{alien.id}")
      if !@bookings.nil? && @bookings.size > 0
        average = @bookings.sum(&:rating) / @bookings.length
        alien.rating = average
      end
      alien.rating = 4
    end
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

    @alien = Alien.find(params[:id])
    if current_user == @alien.user
      if @alien.update_attributes(alien_params)
        redirect_to alien_path(@alien)
      else
        render action: :edit
      end
    else
      redirect_to alien_path(@alien), notice: 'Cannot edit alien'
    end
  end

  def show
    @alien = Alien.find(params[:id])
    @bookings = Booking.where("alien_id = ?", "#{@alien.id}")
    if !@bookings.nil? && @bookings.size > 0
      average = @bookings.sum(&:rating) / @bookings.length
      @alien.rating = average
    end
    @alien.rating = 3
  end

  def destroy
    @alien = Alien.find(params[:id])
    if current_user == @alien.user
      @alien.destroy
      redirect_to aliens_path, notice: 'Alien was destroyed.'
    else
      redirect_to aliens_path, notice: 'Cannot delete alien.'
    end
  end

  private

  def alien_params
    params.require(:alien).permit(:name, :species, :planet, :user, :photo)
  end
end
