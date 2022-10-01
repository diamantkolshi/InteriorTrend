require 'rails_helper'

RSpec.describe Color, type: :model do
  describe "Associations" do
    it { should have_many(:ingredient_colors) }
    it { should have_many(:ingredients).through(:ingredient_colors) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
