require 'rails_helper'

RSpec.describe Material, type: :model do
  describe "Associations" do
    it { should have_many(:ingredient_materials)}
    it { should have_many(:ingredients).through(:ingredient_materials) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
