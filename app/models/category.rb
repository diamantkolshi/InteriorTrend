class Category < ApplicationRecord
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :category, :foreign_key => "parent_id", :class_name => "Category", optional: true
  has_many :ingredients

  validates_presence_of :name
end
