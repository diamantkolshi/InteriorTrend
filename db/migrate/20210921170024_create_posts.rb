class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :project, index: true
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
