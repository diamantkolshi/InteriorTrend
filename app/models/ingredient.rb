class Ingredient < ApplicationRecord
  include InertiaErrors
  
  belongs_to :post
  belongs_to :form
  belongs_to :style
  belongs_to :category
  has_many :ingredient_colors
  has_many :colors, through: :ingredient_colors
  has_many :ingredient_materials
  has_many :materials, through: :ingredient_materials
  has_many :favorites

  validates_presence_of :name, :price, :form_id, :position_x, :position_y
end
