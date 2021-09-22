require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "Associations" do
    it { should belong_to(:post) }
    it { should belong_to(:form) }
    it { should belong_to(:style) }
    it { should belong_to(:category) }
  end

  describe "Validations" do
  end
end
