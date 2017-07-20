class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost, :calories, :calories_from_fat, :total_fat, :saturated_fat, :trans_fat, :cholesterol, :sodium, :carbohydrates, :dietary_fiber, :sugars, :protein
end
