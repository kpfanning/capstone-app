Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get "/restaurants" => "restaurants#index"
  get "/images" => "images#index"
  get "/restaurant_users" => "restaurant_users#index"
  get "/restaurant_users/:review" => "restaurant_users#show"
  post "/restaurant_users" => "restaurant_users#create"
  post "/users" => "users#create"

  get "/yelps" => "yelps#index"

end
