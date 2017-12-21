class AddRatingsToRestaurantUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurant_users, :ratings, :string
  end
end
