class ProjectsController < ApplicationController
  def index
    projects = Project.all

    render inertia: 'Projects/Index', props: {
      projects: projects.as_json(only: [:title])
    }
  end
end
