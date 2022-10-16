require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let!(:role) { FactoryBot.create(:role, name: "client") }
  let!(:nationality) { FactoryBot.create(:nationality, name: "Nationality") }
  let!(:city) { FactoryBot.create(:city, name: "City", nationality: nationality) }
  let!(:user) { FactoryBot.create(:user, email: "client@mail.com", password: "password", role: role) }
  let!(:project) { FactoryBot.create(:project, user: user) }

  before(:each) do
    project
    sign_in user
    @current_user = user
  end

  describe '#index' do
    it 'return all projects' do
      get :index

      expect(assigns(:projects)).to eq(@current_user.projects.all)
    end

    it 'return projects by city filters' do
      get :index, params: { city: City.first.id }

      city_projects = @current_user.projects.where(city_id: City.first.id)
      expect(assigns(:projects)).to eq(city_projects)
    end

    it 'return projects by search filters' do
      get :index, params: { search: 'Project 3' }

      expect(assigns(:projects)).to eq(@current_user.projects.search("Project 3"))
    end

    it 'return none projects with wrong date filters' do
      get :index, params: { date: DateTime.now + 1.month }

      expect(assigns(:projects)).to eq([])
    end

    it 'return none projects with correct date range filters' do
      date = DateTime.now - 1.month
      get :index, params: { date: date }

      expect(assigns(:projects).length).to eq(@current_user.projects.all.length)
    end
  end

  describe '#new' do
    it 'build new project obj' do
      get :new

      expect(assigns(:project).as_json).to eq(@current_user.projects.new.as_json)
    end
  end

  describe '#create' do
    it 'create new project item' do
      params = { project: { title: 'Next project', description: 'Next project desc', street: 'Next project street', city_id: city.id}}

      expect { post :create, params: params }.to change(Project, :count).by(1)
      expect(Project.last.title).to eq(params[:project][:title])
    end
  end

  describe '#edit' do
    it 'set specific project' do
      get :edit, params: { id: @current_user.projects.first.id }

      expect(assigns(:project)).to eq(@current_user.projects.first)
    end
  end

  describe '#update' do
    it 'update project item' do
      project = @current_user.projects.last
      params = { id: project.id, project: { title: 'Edit project', description: project.description, street: project.street}}

      expect { put :update, params: params }.to change(Project, :count).by(0)
      expect(Project.last.title).to eq(params[:project][:title])
    end
  end

  describe '#destroy' do
    it 'destroy project' do
      expect { delete :destroy, params: {id: Project.last.id} }.to change(Project, :count).by(-1)
    end
  end
end
