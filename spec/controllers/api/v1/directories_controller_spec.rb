require 'rails_helper'

RSpec.describe Api::V1::DirectoriesController, type: :controller do
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

  before do 
    directory
  end

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

  describe "#POST create" do 
    before do 
      auth_headers_for(user)
    end

    context "creates successfully" do 
      it "create successfully directory" do 
        expect {
          get :create, params: { directory: { name: "New Directory" } }
        }.to change(Directory, :count).by(1)

        new_directory = Directory.last

        expect(new_directory.name).to eq("New Directory")
      end

      it "no creates dublicates directory with the same name" do 
        expect {
          get :create, params: { directory: { name: "Directory name" } }
        }.to change(Directory, :count).by(0)
      end
    end

    context "errors" do 
      it "name is taken" do 
        expect {
          get :create, params: { directory: { name: "Directory name" } }
        }.to change(Directory, :count).by(0)
        
        @json_result = json_response_body
        expect(@json_result[:errors][:name]).to_not eq(nil)
      end
    end
  end

  describe "#PUT Update" do 
    before do 
      auth_headers_for(user)
    end

    context "update successfully" do 
      it "update successfully directory" do
        expect {
          get :update, params: { id: directory.id, directory: { name: "Update Directory" } }
        }.to change(Directory, :count).by(0)

        directory.reload 

        expect(directory.name).to eq("Update Directory")
      end
    end

    context "errors" do 
      it "name is taken" do 
        expect {
          get :update, params: { id: directory.id, directory: { name: directory.name } }
        }.to change(Directory, :count).by(0)
      end
    end
  end

  describe "#DELETE destroy" do 
    before do 
      auth_headers_for(user)
    end

    it "Delete successfully directory" do 
      expect {
        delete :destroy, params: { id: directory.id }
       }.to change(Directory, :count).by(-1)
    end
  end
end