class Projects::IngredientsController < Projects::BaseController
  before_action :find_post

  def new
    @posts = @project.posts.where.not(id: nil)
    @ingredients = @post.ingredients
    @ingredient = @post.ingredients.new 

    @ingredient.assign_attributes(point_params)
    
    inertia('projects/posts/Edit', {
      project: @project.as_json,
      posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
      post: @post.as_json(only: [:id, :title, :description, :image_url, :created_at]),
      ingredients: @ingredients.map(&method(:ingredient_as_json)),
      ingredient: @ingredient.as_json(methods: [:color_ids, :material_ids]),
      type: 'create'
    })
  end

  def create 
    ingredient = @post.ingredients.new
    ingredient.assign_attributes(ingredient_params)

    if ingredient.save
      flash[:message] = t('controllers.ingredient.created_successfully')
      redirect_to edit_project_post_path(@project, @post)   
    else      
      set_errors(:ingredient, ingredient.inertia_errors)
      redirect_to new_project_post_ingredient_path(@project, @post)
    end
  end

  def edit 
    @ingredients = @post.ingredients
    @posts = @project.posts.where.not(id: nil)
    @ingredient = @ingredients.find(params[:id])

    inertia('projects/posts/Edit', {
      project: @project.as_json,
      posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
      post: @post.as_json(only: [:id, :title, :description, :image_url, :created_at]),
      ingredients: @ingredients.map(&method(:ingredient_as_json)),
      ingredient: @ingredient.as_json(methods: [:color_ids, :material_ids]),
      type: 'edit'
    })
  end
  
  def update 
    @ingredient = @post.ingredients.find(params[:id])
    @ingredient.assign_attributes(ingredient_params)

    if @ingredient.save
      flash[:message] = t('controllers.ingredient.update_successfully')
      redirect_to edit_project_post_path(@project, @post)
    else
      set_errors(:project, @ingredient.inertia_errors)
      redirect_to new_project_post_ingredient_path(@ingredient, @post)
    end   
  end

  private

  def ingredient_as_json(ingredient)
    {
        id: ingredient.id,
        name: ingredient.name,
        price: ingredient.price,
        position_x: ingredient.position_x,
        position_y: ingredient.position_y,
        width: ingredient.width,
        height: ingredient.height,
        style: ingredient.style&.name,
        form: ingredient.form&.name,
        category: ingredient.category&.name,
        colors: ingredient.colors.map do |color|
          {
            name: color.name,
            hex: color.hex
          }
        end,
        materials: ingredient.materials.map do |material|
          {
            name: material.name,
          }
        end
    }
  end

  def point_params 
    params.permit(:position_x, :position_y, :width, :height)
  end

  def ingredient_params 
    params.require(:ingredient).permit( :name, :price, :style_id, :form_id, :category_id, :position_x, :position_y, :width, :height, 
                                        :color_ids => [], :material_ids => [])
  end

  def find_post
    @post = Post.find_by_id!(params[:post_id])
  end
end
