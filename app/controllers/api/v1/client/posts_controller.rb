class Api::V1::Client::PostsController < Api::V1::BaseController
  def index
    @posts = Post.all

    render json: {
      results: @posts.as_json
    }
  end
end
