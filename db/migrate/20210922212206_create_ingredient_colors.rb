class CreateIngredientColors < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_colors do |t|
      t.references :ingredient
      t.references :color
      t.timestamps
    end
  end
end
