require "unirest"
require "pp"

puts "Welcome to MyEats"

"[1] Get Restaurant Users"
"[2] Get Restaurants"
"[3] Get blankReviews"
"[4] Get Images"

input = gets.chomp

if input == "1"
  response = Unirest.get("http://localhost:3000/restaurant_users") 
  reviews = response.body
  pp reviews
end

if input == "2"
  response = Unirest.get("http://localhost:3000/restaurants") 
  restaurants = response.body
  pp restaurants
end

if input == "3"
  print "Enter: "
  review = gets.chomp
  response = Unirest.get("http://localhost:3000/restaurant_users/#{review}")
  pp response.body
end

if input == "4"
  response = Unirest.get("http://localhost:3000/images")
  images = response.body
  pp images
end