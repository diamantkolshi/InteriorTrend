require 'rails_helper'

RSpec.describe Style, type: :model do
  describe "Associations" do
    it { should have_many(:ingredients) }
  end

  describe "Validations" do
  end
end
