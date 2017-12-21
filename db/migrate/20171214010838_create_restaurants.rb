class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :rating
      t.text :review
      t.string :value
      t.string :cost
      t.string :food_type
      t.string :speed
      t.string :drink_list

      t.timestamps
    end
  end
end
