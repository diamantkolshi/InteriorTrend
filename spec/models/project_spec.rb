require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:city).optional }
    it { should have_many(:posts) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  let!(:role) { FactoryBot.create(:role, name: "Client")  }
  let!(:user) { FactoryBot.create(:user, password: "password", role: role) }
  let!(:project1) { FactoryBot.create(:project, user: user, title: "Project 1") }
  let!(:project2) { FactoryBot.create(:project, user: user, title: "Project 2") }
  let!(:project3) { FactoryBot.create(:project, user: user, title: "Project 3") }

  let!(:post1) { FactoryBot.create(:post, title: "Post 1", project: project1) }
  let!(:post2) { FactoryBot.create(:post, title: "Post 2", project: project2) }
  let!(:post3) { FactoryBot.create(:post, title: "Post 3", project: project3) }
  
  let!(:style_ingredient_1) { FactoryBot.create(:style, name: "Style 1") }
  let!(:style_ingredient_2) { FactoryBot.create(:style, name: "Style 2") }
  let!(:style_ingredient_3) { FactoryBot.create(:style, name: "Style 3") }

  let!(:form_ingredient_1) { FactoryBot.create(:form, name: "Form 1") }
  let!(:form_ingredient_2) { FactoryBot.create(:form, name: "Form 2") }
  let!(:form_ingredient_3) { FactoryBot.create(:form, name: "Form 3") }

  let!(:category_ingredient_1) { FactoryBot.create(:category, name: "category 1") }
  let!(:category_ingredient_2) { FactoryBot.create(:category, name: "category 2") }
  let!(:category_ingredient_3) { FactoryBot.create(:category, name: "category 3") }
  let!(:category_ingredient_4) { FactoryBot.create(:category, name: "category 4") }

  let!(:color1) { FactoryBot.create(:color, name: "color 1") }
  let!(:color2) { FactoryBot.create(:color, name: "color 2") }
  let!(:color3) { FactoryBot.create(:color, name: "color 3") }

  let!(:material1) { FactoryBot.create(:material, name: "material 1") }
  let!(:material2) { FactoryBot.create(:material, name: "material 2") }
  let!(:material3) { FactoryBot.create(:material, name: "material 3") }

  let!(:ingredient1) { 
    FactoryBot.create(
      :ingredient, 
      name: "Ingredient 1", 
      post: post1,
      style: style_ingredient_1, 
      form: form_ingredient_1,
      category: category_ingredient_1
    ) 
  }
  let!(:ingredient2) { 
    FactoryBot.create(
      :ingredient, 
      name: "Ingredient 2", 
      post: post2, 
      style: style_ingredient_2, 
      form: form_ingredient_2,
      category: category_ingredient_2
    ) 
  }
  let!(:ingredient3) { 
    FactoryBot.create(
      :ingredient, 
      name: "Ingredient 3", 
      post: post3, 
      style: style_ingredient_3, 
      form: form_ingredient_3,
      category: category_ingredient_3
    ) 
  }

  let!(:color_ingredient_1) { FactoryBot.create(:ingredient_color, ingredient: ingredient1, color: color1) }
  let!(:color_ingredient_2) { FactoryBot.create(:ingredient_color, ingredient: ingredient2, color: color2) }
  let!(:color_ingredient_3) { FactoryBot.create(:ingredient_color, ingredient: ingredient3, color: color3) }

  let!(:material_ingredient_1) { FactoryBot.create(:ingredient_material, ingredient: ingredient1, material: material1) }
  let!(:material_ingredient_2) { FactoryBot.create(:ingredient_material, ingredient: ingredient2, material: material2) }
  let!(:material_ingredient_3) { FactoryBot.create(:ingredient_material, ingredient: ingredient3, material: material3) }

  before do 
    project1
    project2
    project3
    ingredient1
    ingredient2
    ingredient3
  end

  describe 'Search' do
    context 'by project' do
      it 'name in general' do
        expect(Project.search("Project").to_a).to eq Project.order(:created_at).all.to_a
      end

      it "with specific name" do
        expect(Project.search("Project 1").length).to eq 1
      end

      it "case insensitive name" do
        expect(Project.search("project").to_a).to eq Project.order(:created_at).all.to_a
      end

      it "not complete name" do
        expect(Project.search("proj").to_a).to eq Project.order(:created_at).all.to_a
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
        projects_result = Project.filter_by_post_categories([category_ingredient_1.id])

        expect(projects_result.length).to eq 1

        projects_result.each do |post|
          expect(post).to eq project1
        end
      end

      it 'fetch posts with the diff subcategories (DISTINCT)' do
        projects_result = Project.filter_by_post_categories([category_ingredient_1.id, category_ingredient_2.id])

        expect(projects_result.length).to eq 2
        expect(projects_result).to eq [project1, project2]
      end

      it 'fetch all posts with the diff subcategories (DISTINCT)' do
        projects_result = Project.filter_by_post_categories([category_ingredient_1.id, category_ingredient_2.id, category_ingredient_3.id])

        expect(projects_result.length).to eq Project.all.length
        expect(projects_result).to eq Project.order(:created_at).all.to_a
      end
    end

    describe '#filter_by_post_forms' do
      it 'return posts with with form' do
        posts_result = Project.filter_by_post_forms([form_ingredient_1.id, form_ingredient_2.id])

        expect(posts_result.length).to eq 2
        expect(posts_result).to eq [project1, project2]
      end

      it 'return all posts with diff format, no dublicate (disctinct)' do
        posts_result = Project.filter_by_post_forms([form_ingredient_1.id, form_ingredient_2.id, form_ingredient_3.id])

        expect(posts_result.length).to eq Project.all.length
      end
    end

    describe '#filter_by_post_styles' do
      it 'return posts with with form' do
        posts_result = Project.filter_by_post_styles([form_ingredient_2.id])

        expect(posts_result.length).to eq 1
        expect(posts_result).to eq [project2]
      end

      it 'return all posts with diff format, no dublicate (disctinct)' do
        posts_result = Project.filter_by_post_styles([form_ingredient_1.id, form_ingredient_2.id, form_ingredient_3.id])

        expect(posts_result.length).to eq Project.all.length
        expect(posts_result).to eq Project.all.order(:created_at).to_a
      end
    end

    describe '#filter_by_post_colors' do
      it 'return posts with with color' do
        posts_result = Project.filter_by_post_colors([color1.id, color2.id])

        expect(posts_result.length).to eq 2
        expect(posts_result).to eq [project1, project2]
      end

      it 'return all posts with diff colors, no dublicate (disctinct)' do
        posts_result = Project.filter_by_post_colors([color1.id, color2.id, color3.id])

        expect(posts_result.length).to eq Project.all.length
      end
    end

    describe '#filter_by_post_materials' do
      it 'return posts with with material' do
        posts_result = Project.filter_by_post_materials([material1.id, material2.id])

        expect(posts_result.length).to eq 2
        expect(posts_result).to eq [project1, project2]
      end

      it 'return all posts with diff materials, no dublicate (disctinct)' do
        posts_result = Project.filter_by_post_materials([material1.id, material2.id, material3.id])

        expect(posts_result.length).to eq Project.all.length
      end
    end
  end
end
