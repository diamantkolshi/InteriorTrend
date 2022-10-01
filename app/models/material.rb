class Material < ApplicationRecord
  has_many :ingredient_materials
  has_many :ingredients, through: :ingredient_materials

  validates_presence_of :name
end
