class RestaurantUser < ApplicationRecord
  has_many :images
  belongs_to :user
  belongs_to :restaurant

  def as_json
    {
      id: id,
      restaurant: restaurant.as_json,
      images: images.as_json,
      ratings: ratings.to_f,
      review: review,
      value: value.to_f,
      cost: cost.to_f,
      food_type: food_type,
      speed: speed,
      drink_list: drink_list.to_f,
      yelp_rating: nil,
      yelp_price: nil
    }
  end
end
