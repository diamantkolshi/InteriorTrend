class Projects::PostsController < Projects::BaseController
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
  end

  def edit
    @post = @project.posts.find(params[:id])
    @posts = @project.posts.where.not(id: nil)

    inertia('projects/posts/Edit', {
      project: @project.as_json,
      posts: @posts.as_json(only: [:id, :title, :description, :image, :created_at]),
      post: @post.as_json(only: [:id, :title, :description, :image_url, :created_at]),
      ingredient: nil
    })
  end

  def update  
  end

  def destroy
  end

  private

  def first_created_at_params
    posts = @project&.posts
    return params[:date].to_date if params[:date].present?
    posts.blank? ? DateTime.now : posts.order(:created_at)&.first.created_at
  end
end
