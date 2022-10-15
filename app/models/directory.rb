class Directory < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :ingredients, through: :favorites

  validates_presence_of :name
end
