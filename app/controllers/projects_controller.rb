class ProjectsController < InertiaController
  def index
    projects = Project.all

    inertia 'projects/Index', {
      projects: projects.as_json(only: [:title, :description, :street, :location, :views], methods: [:city]),
      project: nil
    }
  end

  def new
    props = {
      projects: Project.all.as_json(only: [:title, :description, :street, :location, :views], methods: [:city]),
      project: Project.new.as_json
    }

    inertia 'projects/Index', props
  end
end
