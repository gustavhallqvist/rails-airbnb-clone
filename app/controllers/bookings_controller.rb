class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user: current_user).reverse
    @booking_requests = current_user.gardens.map { |garden| garden.bookings}
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.garden = Garden.find(params[:garden_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
   @bookings = Booking.where(user: current_user)
   @markers = [{lat: @booking.garden.latitude, lng: @booking.garden.longitude}]
  end

  def edit; end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
