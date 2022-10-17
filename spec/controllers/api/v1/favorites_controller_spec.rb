require 'rails_helper'

RSpec.describe Api::V1::FavoritesController, type: :controller do
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
  let!(:ingredient2) { 
    FactoryBot.create(
      :ingredient, 
      name: "Ingredient 2", 
      post: post1,
      style: style_ingredient_1, 
      form: form_ingredient_1,
      category: category_ingredient_1
    ) 
  }
  let!(:directory) { FactoryBot.create(:directory, name: "Directory name", limit_price: 230.5, user: user) }
  let!(:favorite) { FactoryBot.create(:favorite, ingredient_id: ingredient1.id, directory_id: directory.id) }

  before do 
    favorite
    auth_headers_for(user)
  end

  describe "#GET index" do
    before do 
      get :index, params: { favorite: { directory_id: directory.id } }
      @json_result = json_response_body
    end

    it "has correct length" do 
      expect(@json_result[:results].length).to eq(1)
      expect(@json_result[:results].length).to eq(@json_result[:total])
    end

    it "returns all favorites of current user" do      
      expect(@json_result[:results].as_json).to eq([favorite.as_json])
    end
  end

  describe "#POST create" do 
    context "creates successfully" do 
      it "create successfully directory" do 
        expect {
          get :create, params: { favorite: { directory_id: directory.id, ingredient_id: ingredient2.id } }
        }.to change(Favorite, :count).by(1)

        new_favorite = Favorite.last

        expect(new_favorite.directory).to eq(directory)
        expect(new_favorite.ingredient).to eq(ingredient2)
      end

      it "no creates dublicates directory with the same directory and ingredient" do 
        expect {
          get :create, params: { favorite: { directory_id: directory.id, ingredient_id: ingredient1.id } }
        }.to change(Favorite, :count).by(0)
      end
    end
  end

  describe "#DELETE destroy" do 
    it "Delete successfully directory" do 
      expect {
        delete :destroy, params: { id: favorite.id }
       }.to change(Favorite, :count).by(-1)
    end
  end
end