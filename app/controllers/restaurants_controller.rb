class RestaurantsController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @review = Review.new
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_task
    @restaurant = Restaurant.find(params[:id])
  end
end
