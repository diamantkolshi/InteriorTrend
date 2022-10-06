class Api::V1::PostsController < Api::V1::BaseController
  def index
    @posts = Post.all
    @posts = @posts.filter_by_styles(params[:style_ids]) if params[:style_ids].present?

    render json: {
      results: @posts.as_json,
      count: @posts.length
    }
  end
end
