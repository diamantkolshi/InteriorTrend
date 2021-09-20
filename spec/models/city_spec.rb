require 'rails_helper'

RSpec.describe City, type: :model do
  describe "Associations" do
    it { should belong_to(:nationality) }
    it { should have_many(:users) }
  end

  describe "Validations" do
  end
end
