require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Associations" do
    it { should belong_to(:project) }
  end

  describe "Validations" do
  end
end
