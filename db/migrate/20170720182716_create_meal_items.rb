class CreateMealItems < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_items do |t|
      t.references :meal, foreign_key: true
      t.references :menu_item, foreign_key: true

      t.timestamps
    end
  end
end
