class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :Name
      t.string :Measurement_unit
      t.string :price
      t.string :Quantity
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
