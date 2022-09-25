class Projects::IngredientsController < Projects::BaseController
  before_action :find_post

  def new
    @posts = @project.posts.where.not(id: nil)
    @ingredient = @post.ingredients

    inertia('projects/posts/Edit', {
      project: @project.as_json,
      posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
      post: @post.as_json(only: [:id, :title, :description, :image_url, :created_at]),
      ingredient: @ingredient.as_json(include: [:colors, :materials])
    })
  end

  def create 
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

  def find_post
    @post = Post.find_by_id!(params[:post_id])
  end
end
