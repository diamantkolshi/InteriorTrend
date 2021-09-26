class CreateNationalities < ActiveRecord::Migration[6.1]
  def change
    create_table :nationalities do |t|
      t.string :name, null: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
