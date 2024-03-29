class Color < ApplicationRecord
  has_many :ingredient_colors
  has_many :ingredients, through: :ingredient_colors

  validates_presence_of :name
end
