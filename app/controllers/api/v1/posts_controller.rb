class Api::V1::PostsController < Api::V1::BaseController
  def index
    @posts = Post.all.includes(:ingredients => [:colors, :materials])
    @posts = @posts.filter_by_styles(params[:style_ids]) if params[:style_ids].present?
    @posts = @posts.filter_by_forms(params[:form_ids]) if params[:form_ids].present?
    @posts = @posts.filter_by_categories(params[:category_ids]) if params[:category_ids].present?
    @posts = @posts.filter_by_colors(params[:color_ids]) if params[:color_ids].present?
    @posts = @posts.filter_by_materials(params[:material_ids]) if params[:material_ids].present?
    
    render json: {
      results: @posts.as_json,
      count: @posts.length
    }
  end
end
