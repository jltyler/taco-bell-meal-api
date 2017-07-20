class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_items, dependent: :destroy
  has_many :menu_items, through: :meal_items
end
