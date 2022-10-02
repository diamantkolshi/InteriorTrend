require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  before do 
    Project.delete_all
    Post.delete_all
    Ingredient.delete_all
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

  describe "#GET index" do
    context "returns posts successfully" do
      before do 
        get :index
        @json_result = json_response_body
      end

      it "has correct keys" do         
        expect(@json_result).to have_key(:results)
        expect(@json_result).to have_key(:count)
      end

      it "has correct length" do 
        expect(@json_result[:results].length).to eq(Post.all.length)
        expect(@json_result[:results].length).to eq(@json_result[:count])
      end
    end

    context "returns postes with style filter" do

    end
  end
end