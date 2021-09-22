require 'rails_helper'

RSpec.describe IngredientColor, type: :model do
  describe "Associations" do
    it { should belong_to(:ingredient) }
    it { should belong_to(:color) }
  end
end
