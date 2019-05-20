class ReviewsController < ApplicationController
  before_action :set_current_restaurant, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @restaurant
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_current_restaurant
    if params[:restaurant_id]
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
  end
end
