class RestaurantUsersController < ApplicationController
  
  def index
    restaurant_user = RestaurantUser.all
    # response = Unirest.get("https://api.yelp.com/v3/businesses/search?term=Ballpark Pub+&location=Chicago&limit=1",
    #   headers: {
    #   "Authorization" => "Bearer #{API_KEY}"})
    # yelp_restaurants = response.body

    render json: restaurant_user.as_json
    # render json: yelp_restaurants.as_json
  end

  def create 
    # if params[:restauarant_id] exists, restaurant = Restaruant.find_by(...)

    # else restaurant = Restaurant.create(name: params[:restuarant_name], ...)

    # then save a new restaurant_user

    restaurant_user = RestaurantUser.new(
      restaurant_id: params["restaurant_id"],
      user_id: "3",
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
    restaurant_user = RestaurantUser.find_by(id: params[:id])
    render json: restaurant_user.as_json
  end
end
