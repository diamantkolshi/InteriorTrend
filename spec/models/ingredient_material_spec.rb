require 'rails_helper'

RSpec.describe IngredientMaterial, type: :model do
  describe "Associations" do
    it { should belong_to(:ingredient) }
    it { should belong_to(:material) }
  end
end
