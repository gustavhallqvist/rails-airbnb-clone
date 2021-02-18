class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
      if @review.save!
        @bookings = Booking.where(user: current_user).reverse
        render "bookings/index"
    end
  end

  def edit
    @review.find(params[:id])
  end

end

private

def params_review
   params.require(:review).permit(:rating, :review, :booking_id)
end

