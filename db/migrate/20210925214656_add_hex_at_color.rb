class AddHexAtColor < ActiveRecord::Migration[6.1]
  def change
    add_column :colors, :hex, :string
  end
end
