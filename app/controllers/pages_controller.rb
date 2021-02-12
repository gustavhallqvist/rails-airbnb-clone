class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @garden = Garden.new
    @gardens = Garden.all
  end
end
