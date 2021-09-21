class City < ApplicationRecord
  belongs_to :nationality
  has_many :users
  has_many :projects
end
