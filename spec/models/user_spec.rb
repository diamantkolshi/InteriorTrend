require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { should belong_to(:role) }
    it { should belong_to(:nationality).optional }
    it { should belong_to(:city).optional }
    it { should have_many(:projects) }
    it { should have_many(:directories) }
  end

  describe "Validations" do
  end
end
