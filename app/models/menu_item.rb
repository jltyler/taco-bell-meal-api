class MenuItem < ApplicationRecord
  has_many :meal_items, dependent: :destroy
end
