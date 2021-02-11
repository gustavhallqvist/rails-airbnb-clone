class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user: current_user).reverse
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.garden = Garden.find(params[:garden_id])
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show
   @bookings = Booking.where(user: current_user)
  end

  def edit; end

  def update
    @booking.update(booking_params)
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
