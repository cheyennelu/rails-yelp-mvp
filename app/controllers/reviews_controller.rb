class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:index, :new, :create]

  def index
    @reviews = Review.where(restaurants: @restaurant)
    @new_review = Review.new
  end

  def new
    @new_review = Review.new
  end

  def create
    @reviews = Review.where(restaurant: @restaurant)
    @new_review = Review.new(strong_params)
    @new_review.restaurant = @restaurant

    if @new_review.save
      redirect_to restaurant_reviews_path(@restaurant)
    else
      render :index
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def strong_params
    params.require(:review).permit(:content)
  end
end
