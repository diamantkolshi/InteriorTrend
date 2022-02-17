class Nationality < ApplicationRecord
  has_many :users
  has_many :cities

  validates_presence_of :name
end
