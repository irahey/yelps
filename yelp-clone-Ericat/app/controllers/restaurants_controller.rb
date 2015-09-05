class RestaurantsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant].permit(:name, :description, :image_url, :postcode, :address, :tube, :latitude, :longitude))


    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant].permit(:name, :description, :image_url, :postcode, :address, :tube, :promoted, :latitude, :longitude))

    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to '/restaurants'
  end
end
