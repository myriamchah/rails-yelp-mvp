class RestaurantsController < ApplicationController
  before_action :set_current_restaurant

  def index
    @restaurants = Restaurant.all
  end

  def show
    set_current_restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number, :rating)
  end

  def set_current_restaurant
    if params[:id]
      @restaurant = Restaurant.find(params[:id])
    end
  end
end
