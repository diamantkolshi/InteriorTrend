class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :user, index: true
      t.references :city, index: true
      t.string :title
      t.text :description
      t.string :street
      t.string :location
      t.integer :views

      t.timestamps
    end
  end
end
