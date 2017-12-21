class RestaurantUser < ApplicationRecord
  has_many :images
  belongs_to :user
  belongs_to :restaurant
end
