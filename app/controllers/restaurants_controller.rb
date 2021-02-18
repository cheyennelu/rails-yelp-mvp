class RestaurantsController < ApplicationController
  before_action :find_resto, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @new_restaurant = Restaurant.new
  end

  def create
    @new_restaurant = Restaurant.new(strong_params)
    if @new_restaurant.save
      redirect_to restaurant_path(@new_restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(strong_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    if @restaurant.destroy
      redirect_to restaurants_path
    end
  end

  private

  def find_resto
    @restaurant = Restaurant.find(params[:id])
  end

  def strong_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
