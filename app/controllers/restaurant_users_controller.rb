class RestaurantUsersController < ApplicationController
  
  def index
    restaurant_user = RestaurantUser.all
    render json: restaurant_user.as_json
  end

  def create 
    restaurant_user = RestaurantUser.new(
      restaurant_id: "",
      user_id: "",
      ratings: params["ratings"],
      review: params["review"],
      value: params["value"],
      cost: params["cost"],
      food_type: params["food_type"],
      speed: params["speed"],
      drink_list: params["drink_list"]
      )
    if restaurant_user.save
      render json: restaurant_user.as_json
    else 
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end

  def show
    restaurant_user = RestaurantUser.find_by(review: params[:review])
    render json: restaurant_user.as_json
  end
end
