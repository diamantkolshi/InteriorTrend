require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:city) }
    it { should have_many(:posts) }
  end

  describe "Validations" do
  end

  describe 'Search' do
    context 'by project' do
      it 'name in general' do
        expect(Project.search("Project").to_a).to eq Project.all.to_a
      end

      it "with specific name" do
        expect(Project.search("Project 1").length).to eq 1
      end

      it "case insensitive name" do
        expect(Project.search("project").to_a).to eq Project.all.to_a
      end

      it "not complete name" do
        expect(Project.search("proj").to_a).to eq Project.all.to_a
      end
    end

    context "by posts" do
      it "with specific post" do
        expect(Project.search("Project 1 Post").length).to eq 1
      end
    end

    context "by city" do
      it "with specific city" do
        expect(Project.search("Prishtina").to_a).to eq Project.where(city_id: 1).to_a
      end
    end
  end

  describe 'Filter' do
  end
end
