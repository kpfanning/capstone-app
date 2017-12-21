class AddReviewToRestaurantUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurant_users, :review, :text
    add_column :restaurant_users, :value, :string
    add_column :restaurant_users, :cost, :string
    add_column :restaurant_users, :food_type, :string
    add_column :restaurant_users, :speed, :string
    add_column :restaurant_users, :drink_list, :string
  end
end
