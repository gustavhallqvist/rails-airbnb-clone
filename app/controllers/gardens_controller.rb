class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @gardens = Garden.search_by_location(params[:query])
    else
      @gardens = Garden.all
    end
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @gardens.geocoded.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garden: garden })
      }
    end
  end

  def show
    @booking = Booking.new
    @markers = [{lat: @garden.latitude, lng: @garden.longitude}]
    @reviews = @garden.reviews
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit; end

  def update
    @garden.update(garden_params)
    redirect_to gardens_path
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :description, :location, :price, :image)
  end
end
