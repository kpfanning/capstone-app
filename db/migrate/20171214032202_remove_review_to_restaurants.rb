class RemoveReviewToRestaurants < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :review, :text
    remove_column :restaurants, :value, :string
    remove_column :restaurants, :cost, :string
    remove_column :restaurants, :food_type, :string
    remove_column :restaurants, :speed, :string
    remove_column :restaurants, :drink_list, :string
    remove_column :restaurants, :rating, :sting
  end
end
