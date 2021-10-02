class Project < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  belongs_to :city
  has_many :posts

  has_many :distinct_post_categories, -> {
    self.where_by_scope(:distinct_categories)
  }, class_name: 'Post', foreign_key: 'project_id'

  pg_search_scope :search, using: { tsearch: { prefix: true } }, against: %i(title), associated_against: {
    posts: [:title, :description],
    city: [:name]
  }

  scope :include_distinct_post_categories, -> { includes(:distinct_post_categories) }
  scope :filter_by_post_categories, -> (categories_ids) {
      include_distinct_post_categories
      .includes(posts: [:ingredients])
      .where(ingredients: { category_id: categories_ids })
  }
end
