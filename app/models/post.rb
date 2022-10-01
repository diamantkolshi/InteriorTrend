class Post < ApplicationRecord
  include InertiaErrors
  include PgSearch::Model
  belongs_to :project
  has_many :ingredients, dependent: :destroy

  has_one_attached :image

  validates_presence_of :title, :description, :image
  validate :image_type, if: -> { image.present? } 

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

  pg_search_scope :search, using: { tsearch: { prefix: true } }, against: %i(title description)

  scope :filter_from_created, -> (created_at) { where(created_at: created_at...DateTime.now) }
  
  def distinct_categories
    categories = self.ingredients.map { |c| c.category }
    categories.uniq
  end

  private

  def image_type
    if !image.content_type.in?(%('image/jpeg image/png'))
      errors.add(:image, "needs to be a jpeg or png!")
    end
 end
end
