class Favorite < ApplicationRecord
  include InertiaErrors
  
  belongs_to :directory
  belongs_to :ingredient
end
