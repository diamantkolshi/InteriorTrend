class City < ApplicationRecord
  belongs_to :nationality
  has_many :users
  has_many :projects

  validates_presence_of :name

  scope :active, -> { where(active: true) }
end
