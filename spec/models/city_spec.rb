require 'rails_helper'

RSpec.describe City, type: :model do
  describe "Associations" do
    it { should belong_to(:nationality) }
    it { should have_many(:users) }
    it { should have_many(:projects) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
