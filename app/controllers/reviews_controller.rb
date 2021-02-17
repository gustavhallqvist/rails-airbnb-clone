class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    ##@review = Review.find(params[:id])
      if @review.save
        redirect_to booking_path(@booking)
    end
  end

  def edit
    @review.find(params[:id])
  end

end

private

def params_review
   params.require(:review).permit(:rating, :review)
end

