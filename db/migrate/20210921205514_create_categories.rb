class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :parent
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
