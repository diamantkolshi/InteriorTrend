class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.references :post, index: true
      t.references :form, index: true
      t.references :style, index: true
      t.references :category, index: true
      t.string :name
      t.float :price
      t.string :position_name
      t.decimal :position_x
      t.decimal :position_y
      t.decimal :width
      t.decimal :height
      t.decimal :size

      t.timestamps
    end
  end
end
