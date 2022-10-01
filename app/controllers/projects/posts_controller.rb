class Projects::PostsController < Projects::BaseController
  include StorageMethods
  
  def index
    @posts = @project.posts
    @posts = @posts.search(params[:search]) if params[:search].present?
    @posts = @posts.filter_from_created(params[:date]) if params[:date].present?

    inertia('projects/Posts', {
        project: @project.as_json,
        posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
        params: params.as_json(only: [:search, :date]),
        firstCreatedAt: first_created_at_params
    })
  end

  def new
    @post = @project.posts.new
    @posts = @project.posts.where.not(id: nil)
    inertia('projects/posts/New', {
      project: @project.as_json,
      posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
      post: @post.as_json(only: [:id, :title, :description, :image, :created_at]),
    })
  end

  def create   
    @post = @project.posts.new(post_permit_params.except(:avatar))

    file = post_permit_params[:avatar]

    @post.image.attach(file)

    if @post.save
      flash[:message] = t('controllers.post.create_successfully')
      redirect_to project_posts_path(@project)
    else
      set_errors(:post, @post.inertia_errors)
      redirect_to new_project_post_path(@project)
    end    
  end

  def edit    
    @post = @project.posts.find(params[:id])
    @posts = @project.posts.where.not(id: nil)
    @ingredients = @post.ingredients
    
    inertia('projects/posts/Edit', {
      project: @project.as_json,
      posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
      post: @post.as_json(only: [:id, :title, :description, :image_url, :created_at]).merge!(post_image_path(@post)),
      ingredients: @ingredients.map(&method(:ingredient_as_json)),
      ingredient: nil
    })
  end

  def update  
  end

  def destroy
    @post = @project.posts.find(params[:id])
    @post.destroy
    flash[:message] = t('controllers.post.deleted_successfully')
    redirect_to project_posts_path(@project)
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

  def post_permit_params 
    params.require(:post).permit(:title, :description, :avatar)
  end

  def first_created_at_params
    posts = @project&.posts
    return params[:date].to_date if params[:date].present?
    posts.blank? ? DateTime.now : posts.order(:created_at)&.first.created_at
  end
end
