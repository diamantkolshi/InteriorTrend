class Api::V1::FavoritesController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :find_directory!, only: [:index, :create]
  before_action :find_favorite!, only: [:destroy]

  def index    
    @favorites = @directory.favorites

    render json: {
      total: @favorites.length,
      results: @favorites.as_json
    }, status: :ok
  end
  
  def create 
    @favorite = @directory.favorites.find_or_initialize_by(favorite_params)

    if @favorite.save
      render json: @favorite.as_json(as_json_config), status: :created
    else
      render json: {errors: @favorite.inertia_errors}, status: :bad_request
    end
  end
  
  def destroy 
    if @favorite.destroy
      render json: {status: :ok}
    else
      render json: { errors: { base: "Something went wrong" } }, status: :bad_request
    end
  end

  private 

  def favorite_params 
    params.require(:favorite).permit(:directory_id, :ingredient_id)
  end

  def find_directory!    
    @directory = Directory.find(favorite_params[:directory_id])
  end

  def find_favorite!    
    @favorite = Favorite.find(params[:id])
  end

  def as_json_config
    { only: [:id, :ingredient_id, :directory_id] }
  end
end
