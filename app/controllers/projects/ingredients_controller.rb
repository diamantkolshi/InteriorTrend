class Projects::IngredientsController < Projects::BaseController
  before_action :find_post

  def new
    @posts = @project.posts.where.not(id: nil)
    @ingredient = @post.ingredients.new 

    @ingredient.assign_attributes(point_params)
    
    inertia('projects/posts/Edit', {
      project: @project.as_json,
      posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
      post: @post.as_json(only: [:id, :title, :description, :image_url, :created_at]),
      ingredient: @ingredient.as_json(include: [:colors, :materials])
    })
  end

  def create 
    ingredient = @post.ingredients.new

    ingredient.assign_attributes(ingredient_params)

    if ingredient.save
      flash[:message] = t('controllers.ingredient.created_successfully')
      redirect_to projects_path
    else
      set_errors(:ingredient, ingredient.inertia_errors)
      redirect_to new_project_post_ingredient_path(@project, @post)
    end
  end

  def edit 
    @posts = @project.posts.where.not(id: nil)
    @ingredient = @post.ingredients.find(params[:id])

    inertia('projects/posts/Edit', {
      project: @project.as_json,
      posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
      post: @post.as_json(only: [:id, :title, :description, :image_url, :created_at]),
      ingredient: @ingredient.as_json(include: [:colors, :materials])
    })
  end
  
  def update 
  end

  private

  def point_params 
    params.permit(:position_x, :position_y, :width, :height)
  end

  def ingredient_params 
    params.require(:ingredient).permit(:name, :price, :style_id, :form_id, :category_id, :position_x, :position_y, :width, :height)
  end

  def find_post
    @post = Post.find_by_id!(params[:post_id])
  end
end
