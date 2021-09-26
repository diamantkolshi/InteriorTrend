require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "Associations" do
    it { should belong_to(:post) }
    it { should belong_to(:form) }
    it { should belong_to(:style) }
    it { should belong_to(:category) }
    it { should have_many(:ingredient_colors)}
    it { should have_many(:colors).through(:ingredient_colors) }
    it { should have_many(:ingredient_materials)}
    it { should have_many(:materials).through(:ingredient_materials) }
  end

  describe "Validations" do
  end
end
