class Material < ApplicationRecord
  has_many :ingredient_materials
  has_many :ingredients, through: :ingredient_materials
end
