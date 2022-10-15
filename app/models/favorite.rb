class Favorite < ApplicationRecord
  belongs_to :directory
  belongs_to :ingredient
end
