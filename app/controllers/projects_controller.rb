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

  def create
    project = Project.new
    project.assign_attributes(permitted_params)

    if project.save
      flash[:message] = "Success"
      redirect_to project_path(patient)
    else
      set_errors(:project, project.inertia_errors)
      redirect_to new_project_path
    end
  end

  private

  def permitted_params
    params.require(:project)
          .permit(:title, :description)
  end
end
