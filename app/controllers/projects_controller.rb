class ProjectsController < InertiaController
  before_action :find_project!, only: [:destroy, :edit, :update]
  before_action :all_projects, only: [:index, :new]

  def index
    @projects = @projects.filter_with_city(params[:city]) if params[:city].present?
    @projects = @projects.search(params[:search]) if params[:search].present?
    @projects = @projects.filter_from_created(params[:date]) if params[:date].present?

    render_default('projects/Index')
  end

  def new
    @project = @current_user.projects.new
    render_default('projects/Index', @project.as_json)
  end

  def create
    project = current_user.projects.new

    project.assign_attributes(permitted_params)

    if project.save
      flash[:message] = t('controllers.project.created_successfully')
      redirect_to projects_path
    else
      set_errors(:project, project.inertia_errors)
      redirect_to new_project_path
    end
  end

  def update
    @project.assign_attributes(permitted_params)

    if @project.save
      flash[:message] = t('controllers.project.created_successfully')
      redirect_to edit_project_path(@project)
    else
      set_errors(:project, @project.inertia_errors)
      redirect_to edit_project_path(@project)
    end
  end

  def edit
    inertia 'projects/Edit', {
      project: @project,
      cities: City.active.as_json(only: [:id, :name]),
      posts: @project.posts.as_json(only: [:id, :title])
    }
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
    @projects = current_user.projects.all
  end

  def permitted_params
    params.require(:project)
          .permit(:title, :description, :street, :location, :city_id)
  end

  def render_default(root = 'projects/Index', project = nil)
    inertia root, {
      projects: @projects.as_json(only: [:id, :title, :description, :created_at, :location, :views], methods: [:city]),
      project: project,
      cities: City.active.as_json(only: [:id, :name]),
      params: params.as_json(only: [:search, :city, :date]),
      firstCreatedAt: first_created_at_params
    }
  end

  def first_created_at_params
    return params[:date].to_date if params[:date].present?
    @projects&.first ? @projects.order(:created_at)&.first.created_at : DateTime.now
  end
end
