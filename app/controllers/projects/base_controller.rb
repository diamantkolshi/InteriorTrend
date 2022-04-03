class Projects::BaseController < InertiaController
  before_action :find_project

  def inertia(page, props)
    props[:project] = project_as_json
    super(page, props)
  end

  protected

  def find_project
    @project = Project.find_by_id!(params[:project_id])
  end

  def project_as_json
    @project.as_json(scope: :show)
  end

end
