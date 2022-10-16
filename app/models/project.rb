class Project < ApplicationRecord
  include PgSearch::Model
  include InertiaErrors

  belongs_to :user
  belongs_to :city, optional: true
  has_many :posts, dependent: :destroy

  validates_presence_of :title, :description

  has_many :distinct_project_posts, -> {
    self.where_by_scope(:distinct_posts)
  }, class_name: 'Post', foreign_key: 'project_id'

  scope :include_distinct_posts, -> { includes(:distinct_project_posts) }
  scope :filter_by_post_categories, -> (categories_ids) {
      include_distinct_posts
      .includes(posts: [:ingredients])
      .where(ingredients: { category_id: categories_ids })
  }
  scope :filter_by_post_forms, -> (form_ids) {
    include_distinct_posts
    .includes(posts: [:ingredients])
    .where(ingredients: { form_id: form_ids })
  }
  scope :filter_by_post_styles, -> (style_ids) {
    include_distinct_posts
    .includes(posts: [:ingredients])
    .where(ingredients: { style_id: style_ids })
  }
  scope :filter_by_post_colors, -> (color_ids) {
    include_distinct_posts
    .includes(posts: [ingredients: [:colors]])
    .where(colors: { id: color_ids })
  }
  scope :filter_by_post_materials, -> (material_ids) {
    include_distinct_posts
    .includes(posts: [ingredients: [:materials]])
    .where(materials: { id: material_ids })
  }

  pg_search_scope :search, using: { tsearch: { prefix: true } }, against: %i(title), associated_against: {
    posts: [:title, :description],
    city: [:name]
  }

  scope :filter_with_city, -> (city) { where(city: city) }
  scope :filter_from_created, -> (created_at) { where(created_at: created_at...DateTime.now) }
end
