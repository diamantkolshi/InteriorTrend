require 'rails_helper'

RSpec.describe Api::V1::DirectoriesController, type: :controller do
  before do
    Project.delete_all
    Post.delete_all
    Ingredient.delete_all
    Style.delete_all
  end

  let!(:role) { FactoryBot.create(:role, name: "client") }
  let!(:user) { FactoryBot.create(:user, email: "user1@mail.com", password: "password", role: role) }
  let!(:project) { FactoryBot.create(:project, user: user) }

  let!(:post1) { FactoryBot.create(:post, title: "Post 1", project: project) } 
  let!(:style_ingredient_1) { FactoryBot.create(:style, name: "Style 1") }
  let!(:form_ingredient_1) { FactoryBot.create(:form, name: "Form 1") }
  let!(:category_ingredient_1) { FactoryBot.create(:category, name: "category 1") }
  let!(:color1) { FactoryBot.create(:color, name: "color 1") }
  let!(:material1) { FactoryBot.create(:material, name: "material 1") }

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
  let!(:directory) { FactoryBot.create(:directory, name: "Directory name", limit_price: 230.5, user: user) }

  describe "#GET index" do
    before do 
      auth_headers_for(user)
      get :index  
      @json_result = json_response_body
    end

    it "has correct length" do 
      expect(@json_result[:results].length).to eq(1)
      expect(@json_result[:results].length).to eq(@json_result[:total])
    end

    it "returns all directories of current user" do
      expect(@json_result[:results]).to eq([directory_to_json(directory)])
    end
  end
end