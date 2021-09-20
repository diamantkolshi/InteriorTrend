require 'rails_helper'

RSpec.describe Role, type: :model do
  describe "Associations" do
    it { should have_many(:users) }
  end

  describe "Validations" do
  end
end
