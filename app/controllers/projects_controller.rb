class ProjectsController < InertiaController
  before_action :find_project!, only: [:destroy, :edit]
  before_action :all_projects, only: [:index, :new, :edit]

  def index
    @projects = @projects.where(city_id: params[:city]) if params[:city].present?

    render_default('projects/Index')
  end

  def new
    render_default('projects/Index', Project.new.as_json)
  end

  def create
    project = Project.new(user_id: 1)

    project.assign_attributes(permitted_params)

    if project.save
      flash[:message] = t('controllers.project.created_successfully')
      redirect_to projects_path
    else
      set_errors(:project, project.inertia_errors)
      redirect_to new_project_path
    end
  end

  def edit
    render_default('projects/Edit', @project)
  end

  def destroy
    @project.destroy
    flash[:message] = t('controllers.project.deleted_successfully')
    redirect_to projects_path
  end

  private

  def find_project!
    @project = Project.find_by!(id: params[:id])
  end

  def all_projects
    @projects = Project.all
  end

  def permitted_params
    params.require(:project)
          .permit(:title, :description, :street, :location, :city_id)
  end

  def render_default(root = 'projects/Index', patient = nil)
    inertia root, {
      projects: @projects.as_json(only: [:id, :title, :description, :created_at, :location, :views], methods: [:city]),
      project: patient,
      cities: City.active.as_json(only: [:id, :name]),
      params: params.as_json(only: [:city, :date])
    }
  end
end
