class IngredientColor < ApplicationRecord
  belongs_to :ingredient
  belongs_to :color
end
