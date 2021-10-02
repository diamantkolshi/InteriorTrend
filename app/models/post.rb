class Post < ApplicationRecord
  belongs_to :project
  has_many :ingredients

  scope :filter_by_categories, -> (categories_ids) {
    select("DISTINCT ON (id, project_id) #{self.table_name}.*")
      .includes(:ingredients)
      .where(ingredients: { category_id: categories_ids })
  }
end
