require 'rails_helper'

RSpec.describe Form, type: :model do
  describe "Associations" do
    it { should have_many(:ingredients) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
