class AddReferencesAtUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :role, foreign_key: true
    add_reference :users, :nationality, foreign_key: true
    add_reference :users, :city, foreign_key: true
  end
end
