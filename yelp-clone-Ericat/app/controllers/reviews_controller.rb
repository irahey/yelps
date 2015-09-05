class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(restaurant: @restaurant)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(params[:review].permit(:name, :body, :ratings))

    #we tied the review to the restaurant AND the user!
    @review.restaurant = @restaurant
    @review.user = current_user

    #we no longer user .valid? as the review now is tied to 'promoted' therefore to restaurants.
    #we added one more validation step
    if @review.save
      # @review.restaurants << @review
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
    @reviews.update(params[:review].permit(:name, :body, :ratings))

    redirect_to @restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
    @reviews.destroy
    redirect_to @restaurant
  end
end
