class YelpsController < ApplicationController

  def index
    search = params[:search]

    response = Unirest.get("https://api.yelp.com/v3/businesses/search?term=#{search}+&location=Chicago&limit=1",
      headers: {
      "Authorization" => "Bearer #{ENV['API_KEY']}"
      }
    )
    sorted = response.body
    
    render json: sorted
  end

  def show
    search_name = Restaurant.find_by(name: params[:name]) 
    response = Unirest.get("https://api.yelp.com/v3/businesses/search?term=#{search_name}+&location=Chicago&limit=1",
      headers: {
      "Authorization" => "Bearer #{ENV['API_KEY']}"
      }
    )
    sorted = response.body
    
    render json: sorted
  end
end
