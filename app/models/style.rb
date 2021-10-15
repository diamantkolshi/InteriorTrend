class Style < ApplicationRecord
  has_many :ingredients

  validates_presence_of :name
end
