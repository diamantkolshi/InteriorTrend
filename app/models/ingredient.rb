class Ingredient < ApplicationRecord
  belongs_to :post
  belongs_to :form
  belongs_to :style
  belongs_to :category
  has_many :ingredient_colors
  has_many :colors, through: :ingredient_colors
  has_many :ingredient_materials
  has_many :materials, through: :ingredient_materials

  validates_presence_of :name, :position_x, :position_y
end
