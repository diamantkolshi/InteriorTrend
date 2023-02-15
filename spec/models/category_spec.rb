require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "Associations" do
    it { should have_many(:subcategories).with_foreign_key(:parent_id).class_name('Category') }
    it { should have_many(:ingredients) }
    it { should belong_to(:category).with_foreign_key(:parent_id).class_name('Category').optional }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe 'actions' do
    let(:main_category) { FactoryBot.create(:category, name: "furniture") }
    let(:main_subcategory1) { FactoryBot.create(:category, name: "furniture_bed", parent_id: main_category.id) }
    let(:main_subcategory2) { FactoryBot.create(:category, name: "furniture_chair", parent_id: main_category.id) }

    before do 
      main_category
      main_subcategory1
      main_subcategory2
    end

    describe "#subcategories" do
      it "length should be 2" do
        expect(main_category.subcategories.count).to eq 2
      end

      it "display subcategories" do
        expect(main_category.subcategories.limit(2)).to eq [main_subcategory1, main_subcategory2]
      end

      it "parent_id nil for main category" do
        expect(main_category.parent_id).to be_nil
      end
    end

    describe '#parent' do
      it "should return main catrgory from subcategory 1" do
        expect(main_subcategory1.category).to eq main_category
      end

      it "should return main catrgory from subcategory 2" do
        expect(main_subcategory2.category).to eq main_category
      end
    end
  end
end
