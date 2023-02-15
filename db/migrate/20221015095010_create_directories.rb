class CreateDirectories < ActiveRecord::Migration[6.1]
  def change
    create_table :directories do |t|
      t.references :user
      t.string :name
      t.float :limit_price
      t.timestamps
    end
  end
end
