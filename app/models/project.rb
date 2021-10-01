class Project < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  belongs_to :city
  has_many :posts

  pg_search_scope :search, using: { tsearch: { prefix: true } }, against: %i(title), associated_against: {
    posts: [:title, :description],
    city: [:name]
  }
end
