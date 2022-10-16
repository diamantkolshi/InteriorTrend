require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Associations" do
    it { should belong_to(:project) }
    it { should have_many(:ingredients) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
  end

  let!(:role) { FactoryBot.create(:role, name: "Client")  }
  let!(:user) { FactoryBot.create(:user, password: "password", role: role) }
  let!(:project) { FactoryBot.create(:project, user: user) }

  let!(:post1) { FactoryBot.create(:post, title: "Post 1", project: project) }
  let!(:post2) { FactoryBot.create(:post, title: "Post 2", project: project) }
  let!(:post3) { FactoryBot.create(:post, title: "Post 3", project: project) }
  
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
    ingredient1
    ingredient2
    ingredient3
  end

  describe 'Filters' do
    describe '#filter_by_categories' do
      it 'return empty for filter with parent category' do
        posts_result = Post.filter_by_categories([category_ingredient_4.id])

        expect(posts_result.length).to eq 0
      end

      it 'fetch post by ingredients subcategories (DISTINCT)' do
        posts_result = Post.filter_by_categories([category_ingredient_1])

        expect(posts_result.length).to eq 1

        posts_result.each do |post|
          expect(post).to eq post1
        end
      end

      it 'fetch posts with the diff subcategories (DISTINCT)' do
        posts_result = Post.filter_by_categories([category_ingredient_1.id, category_ingredient_2.id])

        expect(posts_result.length).to eq 2
        expect(posts_result).to eq [post1, post2]
      end

      it 'fetch all posts with the diff subcategories (DISTINCT)' do
        posts_result = Post.filter_by_categories([category_ingredient_1.id, category_ingredient_2.id, category_ingredient_3.id])

        expect(posts_result.length).to eq Post.all.length
        expect(posts_result).to eq Post.order(:created_at).all.to_a
      end
    end
  end

  describe '#filter_by_forms' do
    it 'return posts with with form' do
      posts_result = Post.filter_by_forms([form_ingredient_1, form_ingredient_2])

      expect(posts_result.length).to eq 2
      expect(posts_result).to eq [post1, post2]
    end

    it 'return all posts with diff formats, no dublicate (disctinct)' do
      posts_result = Post.filter_by_forms([form_ingredient_1, form_ingredient_2, form_ingredient_3])

      expect(posts_result.length).to eq Post.all.length
      expect(posts_result).to eq Post.order(:created_at).all.to_a
    end
  end

  describe '#filter_by_styles' do
    it 'return posts with with style' do
      posts_result = Post.filter_by_styles([style_ingredient_2])

      expect(posts_result.length).to eq 1
      expect(posts_result).to eq [post2]
    end

    it 'return all posts with diff styles, no dublicate (disctinct)' do
      posts_result = Post.filter_by_styles([style_ingredient_1, style_ingredient_2, style_ingredient_3])

      expect(posts_result.length).to eq Post.all.length
    end
  end

  describe '#filter_by_colors' do
    it 'return posts with with color' do
      posts_result = Post.filter_by_colors([color1.id, color2.id])

      expect(posts_result.length).to eq 2
      expect(posts_result).to eq [post1, post2]
    end

    it 'return all posts with diff colors, no dublicate (disctinct)' do
      posts_result = Post.filter_by_colors([color1.id, color2.id, color3.id])

      expect(posts_result.length).to eq Post.all.length
      expect(posts_result).to eq Post.order(:created_at).all.to_a
    end
  end

  describe '#filter_by_materials' do
    it 'return posts with with material' do
      posts_result = Post.filter_by_materials([material1.id, material2.id])

      expect(posts_result.length).to eq 2
      expect(posts_result).to eq [post1, post2]
    end

    it 'return all posts with diff materials, no dublicate (disctinct)' do
      posts_result = Post.filter_by_materials([material1.id, material2.id, material3.id])

      expect(posts_result.length).to eq Post.all.length
      expect(posts_result).to eq Post.order(:created_at).all.to_a
    end
  end

  describe '#distinct_categories' do
    it "return all categories from ingradients without dublicate" do
      post = Post.first
      
      expect(post.ingredients.length).to eq 1
      expect(post.distinct_categories.class).to eq Array
      expect(post.distinct_categories.length).to eq 1
    end
  end
end
