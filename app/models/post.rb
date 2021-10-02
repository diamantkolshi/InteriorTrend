class Post < ApplicationRecord
  belongs_to :project
  has_many :ingredients

  scope :distinct_categories, -> {
    select("DISTINCT ON (id) #{self.table_name}.*")
  }
  scope :filter_by_categories, -> (categories_ids) {
    self.distinct_categories
      .includes(:ingredients)
      .where(ingredients: { category_id: categories_ids })
  }
end
