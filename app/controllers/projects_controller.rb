class ProjectsController < InertiaController
  before_action :find_project!, only: [:destroy]

  def index
    render_default
  end

  def new
    render_default Project.new.as_json
  end

  def create
    project = Project.new(user_id: 1)

    project.assign_attributes(permitted_params)

    if project.save
      flash[:success] = "Success created"
      redirect_to projects_path
    else
      set_errors(:project, project.inertia_errors)
      redirect_to new_project_path
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Success deleted"
    redirect_to projects_path
  end

  private

  def find_project!
    @project = Project.find_by!(id: params[:id])
  end

  def permitted_params
    params.require(:project)
          .permit(:title, :description, :street, :location, :city_id)
  end

  def render_default(patient = nil)
    inertia 'projects/Index', {
      projects: Project.all.as_json(only: [:id, :title, :description, :street, :location, :views], methods: [:city]),
      project: patient,
      cities: City.active.as_json(only: [:id, :name])
    }
  end
end
