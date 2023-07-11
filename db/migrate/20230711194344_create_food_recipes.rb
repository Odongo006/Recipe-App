class CreateFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :food_recipes do |t|
      t.integer :quantity
      t.belongs_to :recipe, null: false, foreign_key: true
      t.belongs_to :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
