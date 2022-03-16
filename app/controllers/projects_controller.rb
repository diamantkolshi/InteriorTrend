class ProjectsController < ApplicationController
  def index
    projects = Project.all

    render inertia: 'Projects/Index', props: {
      projects: projects.as_json(only: [:title, :description, :street, :location, :views], methods: [:city])
    }
  end
end
