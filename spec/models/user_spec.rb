require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { should belong_to(:role) }
    it { should belong_to(:nationality).optional }
    it { should belong_to(:city) }
    it { should have_one(:directory) }
    it { should have_many(:projects) }
  end

  describe "Validations" do
  end
end
