class YelpsController < ApplicationController
  # require "json"
  # require "Unirest"

  def index
    #   url = "#{API_HOST}#{SEARCH_PATH}"
    # response = Unirest.get("https://api.yelp.com/v3/businesses/search?term=taco+&location=Chicago&limit=5").header("Authorization", "Bearer #{API_KEY}")
    # The below works -------------------
    #  response = Unirest.get("https://api.yelp.com/v3/businesses/search?term=taco+&location=Chicago&limit=5",
    #   headers: {
    #   "Authorization" => "Bearer #{API_KEY}"
    #   }
    # )

    # search_name = "Ballpark Pub"
    # "Authorization" => "Bearer #{ENV['API_KEY']}"

    response = Unirest.get("https://api.yelp.com/v3/businesses/search?term=Ballpark Pub+&location=Chicago&limit=1",
      headers: {
      "Authorization" => "Bearer #{ENV['API_KEY']}"
      }
    )
    sorted = response.body
    
    render json: sorted
  end
end
