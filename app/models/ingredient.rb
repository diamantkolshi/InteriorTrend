class Ingredient < ApplicationRecord
  belongs_to :post
  belongs_to :form
  belongs_to :style
  belongs_to :category
end
