class MealItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :meal
  has_one :menu_item
end
