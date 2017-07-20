class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.float :cost
      t.integer :calories
      t.integer :calories_from_fat
      t.integer :total_fat
      t.integer :saturated_fat
      t.integer :trans_fat
      t.integer :cholesterol
      t.integer :sodium
      t.integer :carbohydrates
      t.integer :dietary_fiber
      t.integer :sugars
      t.integer :protein

      t.timestamps
    end
  end
end
