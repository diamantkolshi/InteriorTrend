require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:city) }
  end

  describe "Validations" do
  end
end
