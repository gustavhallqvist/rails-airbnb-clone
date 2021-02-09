class BookingsController < ApplicationController
  def edit; end

  def update
    @booking.update(booking_params)
    redirect_to booking_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :confirmed)
  end
end
