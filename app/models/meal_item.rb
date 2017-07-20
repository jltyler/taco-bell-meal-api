class MealItem < ApplicationRecord
  belongs_to :meal
  belongs_to :menu_item
end
