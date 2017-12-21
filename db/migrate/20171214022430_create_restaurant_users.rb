class CreateRestaurantUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurant_users do |t|
      t.string :restaurant_id
      t.string :user_id

      t.timestamps
    end
  end
end
