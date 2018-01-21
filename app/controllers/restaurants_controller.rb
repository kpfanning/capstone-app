class RestaurantsController < ApplicationController
  def index 
    restaurants = Restaurant.all
    if params[:search]
      restaurants = Restaurant.where(name: params[:search
        ])
    end
    render json: restaurants.as_json
  end
end
