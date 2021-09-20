require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { should belong_to(:role) }
    it { should belong_to(:nationality) }
    it { should belong_to(:city) }
  end

  describe "Validations" do
  end
end
