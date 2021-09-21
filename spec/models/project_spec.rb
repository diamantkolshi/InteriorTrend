require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:city) }
    it { should have_many(:posts) }
  end

  describe "Validations" do
  end
end
