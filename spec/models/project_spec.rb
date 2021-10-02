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
        expect(Project.search("Project 1 Project").length).to eq 1
      end
    end

    context "by city" do
      it "with specific city" do
        expect(Project.search("Prishtina").to_a).to eq Project.where(city_id: 1).to_a
      end
    end
  end

  describe 'Filter' do
    describe '#filter_by_post_categories' do
      it 'return empty for filter with parent category' do
        projects_result = Project.filter_by_post_categories([1,2,3])

        expect(projects_result.length).to eq 0
      end

      it 'fetch post by ingredients subcategories (DISTINCT)' do
        projects_result = Project.filter_by_post_categories([6,7])

        expect(projects_result.length).to eq 1

        projects_result.each do |post|
          expect(post).to eq projects(:project1)
        end
      end

      it 'fetch posts with the diff subcategories (DISTINCT)' do
        projects_result = Project.filter_by_post_categories([6,7,12])

        expect(projects_result.length).to eq 2
        expect(projects_result).to eq [Project.first, Project.second]
      end

      it 'fetch all posts with the diff subcategories (DISTINCT)' do
        projects_result = Project.filter_by_post_categories([6,7,12,13,14,16,18,19])

        expect(projects_result.length).to eq Project.all.length
        expect(projects_result).to eq Project.all.to_a
      end
    end
  end
end
