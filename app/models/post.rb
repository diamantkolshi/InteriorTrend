class Post < ApplicationRecord
  belongs_to :project
  has_many :ingredients

  validates_presence_of :title

  scope :distinct_posts, -> (params = nil) {
    select("DISTINCT ON (id) #{self.table_name}.*")
  }
  scope :filter_by_categories, -> (categories_ids) {
    self.distinct_posts
      .includes(:ingredients)
      .where(ingredients: { category_id: categories_ids })
  }
  scope :filter_by_forms, -> (form_ids) {
    self.distinct_posts
      .includes(:ingredients)
      .where(ingredients: { form_id: form_ids })
  }
  scope :filter_by_styles, -> (style_ids) {
    self.distinct_posts
      .includes(:ingredients)
      .where(ingredients: { style_id: style_ids })
  }
  scope :filter_by_colors, -> (colors_ids) {
    self.distinct_posts
      .includes(ingredients: [:colors])
      .where(colors: { id: colors_ids })
  }
  scope :filter_by_materials, -> (materials_ids) {
    self.distinct_posts
      .includes(ingredients: [:materials])
      .where(materials: { id: materials_ids })
  }

  def distinct_categories
    categories = self.ingredients.map { |c| c.category }
    categories.uniq
  end
end
