require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe '#index' do
    it 'return all projects' do
      get :index

      expect(assigns(:projects)).to eq(Project.all)
    end

    it 'return projects by city filters' do
      get :index, params: { city: City.first.id }

      city_projects = Project.where(city_id: City.first.id)
      expect(assigns(:projects)).to eq(city_projects)
    end

    it 'return projects by search filters' do
      get :index, params: { search: 'Project 1' }

      expect(assigns(:projects).length).to eq(1)
      expect(assigns(:projects).first.title).to eq('Project 1')
    end

    it 'return none projects with wrong date filters' do
      get :index, params: { date: DateTime.now + 1.month }

      expect(assigns(:projects)).to eq([])
    end

    it 'return none projects with correct date range filters' do
      date = DateTime.now - 1.month
      get :index, params: { date: date }

      expect(assigns(:projects).length).to eq(Project.all.length)
    end
  end

  describe '#new' do
    it 'build new project obj' do
      get :new

      expect(assigns(:project).as_json).to eq(Project.new.as_json)
    end
  end

  describe '#create' do
    it 'create new project item' do
      params = { project: { title: 'Next project', description: 'Next project desc', street: 'Next project street', city_id: City.second.id}}

      expect { post :create, params: params }.to change(Project, :count).by(1)
      expect(Project.last.title).to eq(params[:project][:title])
    end
  end

  describe '#edit' do
    it 'set specific project' do
      get :edit, params: { id: Project.first.id }

      expect(assigns(:project)).to eq(Project.first)
    end
  end

  describe '#destroy' do
    it 'destroy project' do
      expect { delete :destroy, params: {id: Project.last.id} }.to change(Project, :count).by(-1)
    end
  end
end
