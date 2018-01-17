class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :restaurant_users
  has_many :restaurants, through: :restaurant_users
end
