class Project < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :posts
end
