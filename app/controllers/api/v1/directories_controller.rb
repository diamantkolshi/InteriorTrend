class Api::V1::DirectoriesController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :find_directory, only: [:update, :destory]

  def index    
    @directories = current_user.directories

    render json: {
      total: @directories.length,
      results: @directories.as_json
    }, status: :ok
  end
  
  def create 
    @new_directory = current_user.directories.new
    @new_directory.assign_attributes(ingredient_params)

    if @new_directory.save
      render json: @new_directory.as_json(as_json_config), status: :created
    else
      render json: {errors: @new_directory.inertia_errors}, status: :bad_request
    end
  end

  def update 
    @directory.assign_attributes(ingredient_params)
    
    if @directory.save
      render json: @directory.as_json(as_json_config), status: :created
    else
      render json: {errors: @directory.inertia_errors}, status: :bad_request
    end
  end
  
  def destory 
    if @directory.destroy
      render json: {status: :ok}
    else
      render json: {errors: {base: "Something went wrong"}}, status: :bad_request
    end
  end

  private 

  def ingredient_params 
    params.require(:directory).permit(:name, :limit_price)
  end

  def find_directory
    @directory = current_user.directories.find(params[:id])
  end

  def as_json_config
    { only: [:id, :name, :limit_price] }
  end
end
