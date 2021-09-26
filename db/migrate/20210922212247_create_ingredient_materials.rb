class CreateIngredientMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_materials do |t|
      t.references :ingredient
      t.references :material
      t.timestamps
    end
  end
end
