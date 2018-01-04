class RestaurantUser < ApplicationRecord
  has_many :images
  belongs_to :user
  belongs_to :restaurant

  def as_json
    {
      id: id,
      restaurant: restaurant.as_json,
      images: images.as_json,
      ratings: ratings,
      review: review,
      value: value,
      cost: cost,
      food_type: food_type,
      speed: speed,
      drink_list: drink_list,
    }
  end
end
