class Api::V1::PostsController < Api::V1::BaseController
  def index
    @posts = Post.all
    
    render json: {
      results: @posts.as_json,
      count: @posts.count
    }
  end
end
