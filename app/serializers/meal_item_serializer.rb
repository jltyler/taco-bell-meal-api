class MealItemSerializer < ActiveModel::Serializer
  attributes :id, :meal_id, :menu_item_id
end
