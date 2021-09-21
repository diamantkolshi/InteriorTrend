class CreateColors < ActiveRecord::Migration[6.1]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :image_url
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
