Rails.application.routes.draw do
  get "/restaurant_users" => "restaurant_users#index"
  post "/users" => "users#create"

end
