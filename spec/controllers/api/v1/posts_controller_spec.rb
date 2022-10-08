require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  before do 
    Project.delete_all
    Post.delete_all
    Ingredient.delete_all
    Style.delete_all
  end

  let!(:role) { FactoryBot.create(:role, name: "client") }
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

  describe "#GET index" do
    context "returns posts successfully" do
      before do 
        get :index
        @json_result = json_response_body
      end

      it "has correct length" do 
        expect(@json_result[:results].length).to eq(Post.all.length)
        expect(@json_result[:results].length).to eq(@json_result[:count])
      end
    end

    context "returns postes with style filter" do
      it "return correct posts with style filter" do 
        get :index, params: { style_ids: [style_ingredient_1.id] }
        @json_result = json_response_body
        
        expect(@json_result[:count]).to eq(1)
        expect(@json_result[:results].as_json).to eq([post1.as_json])
      end

      it "return correct posts with more then one style filter" do 
        get :index, params: { style_ids: [style_ingredient_1.id, style_ingredient_2.id] }
        @json_result = json_response_body
        
        expect(@json_result[:count]).to eq(2)
        expect(@json_result[:results].as_json).to eq([post1.as_json, post2.as_json])
      end
    end

    context "returns postes with form filter" do
      it "return correct posts with form filter" do 
        get :index, params: { form_ids: [form_ingredient_1.id] }
        @json_result = json_response_body
        
        expect(@json_result[:count]).to eq(1)
        expect(@json_result[:results].as_json).to eq([post1.as_json])
      end

      it "return correct posts with more then one form filter" do 
        get :index, params: { form_ids: [form_ingredient_1.id, form_ingredient_2.id] }
        @json_result = json_response_body
        
        expect(@json_result[:count]).to eq(2)
        expect(@json_result[:results].as_json).to eq([post1.as_json, post2.as_json])
      end
    end

    context "returns postes with category filter" do
      it "return correct posts with category filter" do 
        get :index, params: { category_ids: [category_ingredient_1.id] }
        @json_result = json_response_body
        
        expect(@json_result[:count]).to eq(1)
        expect(@json_result[:results].as_json).to eq([post1.as_json])
      end

      it "return correct posts with more then one category filter" do 
        get :index, params: { category_ids: [category_ingredient_1.id, category_ingredient_2.id] }
        @json_result = json_response_body
        
        expect(@json_result[:count]).to eq(2)
        expect(@json_result[:results].as_json).to eq([post1.as_json, post2.as_json])
      end
    end

    context "returns postes with color filter" do
      it "return correct posts with color filter" do 
        get :index, params: { color_ids: [color1.id] }
        @json_result = json_response_body

        expect(@json_result[:count]).to eq(1)
        expect(@json_result[:results].as_json).to eq([post1.as_json])
      end

      it "return correct posts with more then one color filter" do 
        get :index, params: { color_ids: [color1.id, color2.id] }
        @json_result = json_response_body
        
        expect(@json_result[:count]).to eq(2)
        expect(@json_result[:results].as_json).to eq([post1.as_json, post2.as_json])
      end
    end

    context "returns postes with material filter" do
      it "return correct posts with material filter" do 
        get :index, params: { material_ids: [material1.id] }
        @json_result = json_response_body

        expect(@json_result[:count]).to eq(1)
        expect(@json_result[:results].as_json).to eq([post1.as_json])
      end

      it "return correct posts with more then one material filter" do 
        get :index, params: { material_ids: [material1.id, material2.id] }
        @json_result = json_response_body
        
        expect(@json_result[:count]).to eq(2)
        expect(@json_result[:results].as_json).to eq([post1.as_json, post2.as_json])
      end
    end
  end
end