require 'rails_helper'

RSpec.describe Color, type: :model do
  before do
    binding.pry
  end

  describe "Associations" do
    it { should have_many(:ingredient_colors) }
    it { should have_many(:ingredients).through(:ingredient_colors) }
  end

  describe "Validations" do
  end
end
