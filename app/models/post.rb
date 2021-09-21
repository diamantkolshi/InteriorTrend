class Post < ApplicationRecord
  belongs_to :project
  has_many :ingredients
end
