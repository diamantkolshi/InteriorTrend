class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.boolean :active, default: true
      t.references :nationality, index: true
      t.timestamps
    end
  end
end
