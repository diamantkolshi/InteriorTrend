class Api::V1::DirectoriesController < Api::V1::BaseController
  before_action :authenticate_user!

  def index    
    @directories = current_user.directories

    render json: {
      total: @directories.length,
      results: @directories.as_json
    }, status: :ok
  end
  
  def create 
  end
end
