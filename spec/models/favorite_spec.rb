require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "Associations" do
    it { should belong_to(:directory) }
    it { should belong_to(:ingredient) }
  end
end
