class RestaurantsController < ApplicationController
  before_action :find_resto, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def add
    @new_restaurant = Restaurant.new(strong_params)
  end

  private

  def find_resto
    @restaurant = Restaurant.find(params[:id])
  end

  def strong_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
