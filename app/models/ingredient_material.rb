class IngredientMaterial < ApplicationRecord
  belongs_to :ingredient
  belongs_to :material
end
