class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :ingredient
      t.references :directory
      t.text :description
      t.timestamps
    end
  end
end
